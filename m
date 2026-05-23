Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE4CCD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 17:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HjZOf7bVbm6B+eRTHEBmeDXi1tZwk3zjXWzPdrWiVjQ=; b=w34iLZ18uY4h1I/znNHzhBqC4b
	2EmP9RJJio4h9lAWOiHelsMYEhc35LK+w6hrNorHxjNIeNmlSFfdwtFCrxf4Ia123CTW808Ol9TpH
	QUfzoWedt+9odGIFo1d+etqHgZfAkyH7maBvlnJ3A3qPC+Jj8b3CKQ6LyAv61u0kgsXit9XTIzQEe
	ntMhDLyAILwhqsVluWsymvIb10fhR7/dqQMMtBhNVcH1BPQGw0fM2eakfFIe19ijyLd8LJQwvQ0qf
	K0cQgGV1vQ3DEl1Fl3ANWwb1xGb512V4iYY9sgKHBNOPLSwe4ecvA0HkBvOFeQWs50UXNdfYsgGFd
	UIHS8ebg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQqDj-0000000DeNC-1dor;
	Sat, 23 May 2026 17:33:07 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQqDg-0000000DeMf-2UKa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 17:33:05 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-841882f8f4bso88096b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 10:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779557583; x=1780162383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HjZOf7bVbm6B+eRTHEBmeDXi1tZwk3zjXWzPdrWiVjQ=;
        b=n+4fBWDFNl6HbNjttUeiQ8XTa2rsIoASS5oeZ9q63CA8Ij3EMdhx4aq5D++JMQVT+O
         HBR+ham5zj4l0kqYDqT8ZtjW2LErouBMhnjswfTKB3tgnnoXoTgLPPlsAwx19rosxinf
         We+5uEyljVuaj95qifNfxXXN4Gx7PH2ET3pNc5QKN1HW8EDIdIsoHGyZUMj9e6QhZ1da
         ogM5BgZbPFOreXlAl6HAmfpLt9wxGAXYK7qYPX1eosn3Zcpavqt/pL9v7DgwKrlY/Iju
         Ec1Qs8V/rNJPqvI5sBH33//5yKNwfNq6bxXc00AZ5LXJz9OK2viL195q4IFv1ZOxCMHT
         m4Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779557583; x=1780162383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjZOf7bVbm6B+eRTHEBmeDXi1tZwk3zjXWzPdrWiVjQ=;
        b=IGeVhk6WhEXljRzK3Uk4yV/MZ12KlRO2bYfZYVWyDgYKbOaXPUstGypan2clEHMQm1
         PHcpfyJYVmjmg3iDCnhWcl1/Ekgod73MUFBINmUvDu+mT7d8Q6a/322JoQGdMF+ocxsz
         fg0s/YKzRx8fAUjoR6Mb5KV8zzCWezTRZKY1L0f5d7JljwtZ92CKs2QnUF+Q6wwfsvDV
         wyFPlnjXshcmvXR2GewKR0nnE51slkyjtNfn92WTwAfPqnArgIL/Y1MuuKVmKkUacEq1
         7MZu49jwlm5Bkt7EsX8hiqVLjWCGICFVebIafqKVdOzYNDniHHVZGTsa8x+oJtY65gV1
         tACA==
X-Forwarded-Encrypted: i=1; AFNElJ+n3EXr80XBk/Yx97ssrs+IEj7N5ivM1sBAJlSjv/qun5hwJdxcsEbvpcv44TJMYMUudTK8fsAfRDU965PkGyIW@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh1CjXF2XKICsgNAPoPSO+befpNyEe6QmPvsCC8+1qbYOUwnFk
	au94NC+eSVpHGD0K7etzhFYiREzasR0j1Ls1pJoFKhZjz2qmD+d4cAdT
X-Gm-Gg: Acq92OHFRcT2BTr747bUBz//P+xZ8flPivI7URYL8vQON8P/MD0gYfkzkvNQsjxgwa4
	0WupX0HWS1E9DMOtQyglVuyc1kK0v3ldNZ3MTVIm8cTV940wCzJVQ74y3rAPOaYowJlaHKClmTT
	CcdTpJ3CndE+OGLswsMUSnsd1K+GddeLOHvKiHyTQUBSluWZ3bKpDevjhdJG9wark0VsUuriAlh
	MDcrIGlNacbKOwKuN6q0dTo3ttRKQTq5F7j5SzAztFSGGxwZ83XLdx+GYOUFJKOZ6o3ZMrHx3YV
	1xce6TMEuwKFInh1j32HuevzJdbhJUAiAtmgC1IKlSCd/oXK4IVRv3Yw+JRGCdYc/nSlGkh0Rea
	oB6ig6YpdO4rlbN8do+X53MHVNBKfmf1ltCRTz9yXSYSt1sfHVMyzuvpw/cA3T0AiRQJPon+HOB
	QG3j5ZQjW0kOCDDfh7885prTgFrvHCPPAdDOZEH92MRPtTYs5HKvJPkMwUjs/KBqPnmg==
X-Received: by 2002:a05:6a00:a383:b0:82f:21ee:270e with SMTP id d2e1a72fcca58-8415f6d0bb4mr8246436b3a.42.1779557582864;
        Sat, 23 May 2026 10:33:02 -0700 (PDT)
Received: from Ubuntu.. ([49.37.171.12])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fc646bsm5162945b3a.46.2026.05.23.10.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 10:33:02 -0700 (PDT)
From: Manish Baing <manishbaing2789@gmail.com>
To: lee@kernel.org,
	ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linusw@kernel.org
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	manishbaing2789@gmail.com
Subject: [PATCH v4 0/2] dt-bindings: mfd/pwm: Split st,stmpe cleanup into separate patches
Date: Sat, 23 May 2026 17:32:49 +0000
Message-ID: <20260523173251.72540-1-manishbaing2789@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_103304_664854_AE9912E9 
X-CRM114-Status: GOOD (  12.53  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

This series splits the previous single patch into two distinct changes
to avoid cross-subsystem merge coordination, as requested by Uwe.

The first patch addresses a validation gap in the MFD YAML schema,
and the second patch drops the redundant legacy PWM text binding.

Changes in v4:
- Split single patch into a 2-patch series based on feedback from Uwe
  Kleine-König to prevent cross-subsystem merge conflicts.

Changes in v3:
- Added 'required' properties to the pwm subnode in st,stmpe.yaml
  to close a validation gap identified by the Sashiko.
- Updated commit message and description to reflect MFD subsystem changes

Changes in v2:
- Drop the TXT file instead of converting to YAML, as the
  functionality is already covered by st,stmpe.yaml.
- Update the commit subject and description to reflect the drop.

Manish Baing (2):
  dt-bindings: mfd: st,stmpe: Add missing properties for PWM subnode
  dt-bindings: pwm: stmpe: drop legacy binding

 .../devicetree/bindings/mfd/st,stmpe.yaml      |  4 ++++
 .../devicetree/bindings/pwm/st,stmpe-pwm.txt   | 18 ------------------
 2 files changed, 4 insertions(+), 18 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/st,stmpe-pwm.txt

-- 
2.43.0


