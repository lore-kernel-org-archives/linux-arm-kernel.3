Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE27E1093181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 07:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MaodLUre5nVZDHJLR3C0Oza+ras1LIWWAXVNzmeoDOA=; b=ZNS+2ybjaHkYQtYPLcSHEhL0Hn
	f4AvIF2ncyQ7+M8sEQ9dlxxtDv09oWDb8PczHr5KFCqT6zrmPBu/OJlGOLaOKfEcaZCDsiZWHSnod
	HMy//IPGltQdjlt7B2g7r0SD5yIiQ6/Rn393t1xClz4t2HpEmiR2QZDr8fF01ZAxXo3EKXJlLeVGZ
	Yqm9PEv70JCT18vRSC9apmVcsBkr4St3FmCw4mnuldaltRdjJ0RXdkPaKLK5KRqjblHGJ0+IWj61X
	te8vpdaj1Dn4OdkgMQ0vQu9JE+AEyehdMv5OQoEHBohbjb4jhvqEHdM/682mOStreVV2WEwSirShY
	gg16FcKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UE6-0000000CFTB-2bWC;
	Fri, 20 Mar 2026 07:24:58 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UE3-0000000CFRu-44iz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 07:24:57 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82ae379000fso234130b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 00:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991495; x=1774596295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MaodLUre5nVZDHJLR3C0Oza+ras1LIWWAXVNzmeoDOA=;
        b=O7dI81i47QqhNWCjU49P1pOY/wFSESV4x4ll7bGa+0iTcDLlEhWprlDF7Mxx/4sfFP
         FK9gjJ1K2iXRXFxBR6l0FX+GB7ySKzkD57kAOI7KuTuFChMl71yEI0DV+SR9fbgnj9Vr
         syJoNe0IJBfGMKwUFu91Ql0WW8/ReQLvOgdpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991495; x=1774596295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaodLUre5nVZDHJLR3C0Oza+ras1LIWWAXVNzmeoDOA=;
        b=jkqUytMgsjDw3SbCm92sRkjCQvrZJDUY/K0BZdWPT6/LiDyEQuVVqPTuhLpQTy3F91
         JApnr5RzynZphlhUZIuY58XChN3gzOYoAjZ7hXOpo0A235DmNsIEf5ndkgtrxXPyhxex
         exvY/XN1CPbHV8gLpO3mlHb6FAckEoDbMw9vsr2ngq7A4K8Q7gOOdk63O28xb/caLciv
         JGda5F/j6WKOsCYeiUbt59LH+Wp4q7dXZTPj2KIQVZDwBgEel6ZOtmGakh1ba1O5Dvg7
         LSD9UTqvna+Rw6MrL2e8zsQgFuIo/yCgcqqFIrDJMQjLewyXnK/gObP0lIuWWGt5Enjc
         MObg==
X-Forwarded-Encrypted: i=1; AJvYcCWUenP+YNsl2BM+nHrbUKqHj2fcbPTDOLeJJcyfhMbqxv9596JOpnYcK/rHSm7zYmaOnUYCjrsjmxqc4n1CBGzQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6ndHxozBCnNvKfz1eFTO4zHtrSN+unkrrDa8dWqhshzcsnG+j
	SIwh98sGxQ1o1CnCT0+vsfm0YQ0Eyn6MrTvPoAG2o1zHCQUMPqvgP2PB99myanRZdw==
X-Gm-Gg: ATEYQzzA1+ydzETqh/v42RCI9oNBY9ZshWgkSRIRLVRrLG2xDJOkoRF08l+AbKxtk5A
	S3qVJ0Y4EjpWHt3jy4o6XwbeHd8ydZT+CV1o1Q9ekDDZZokofTFMpBH7w979Xh6uRuuvUdpsYRB
	fER+1n6lYFtIkIvvYJKhcynvk2Os2xCtPe3nSZp+z3JOYjh16XPZeuQflrj9KtD1vILvyTEUON9
	Qa5jVqzFP6lOIYidclCbK66CRx8EWVwDyrRuTUtgY0z5kokB4TULycgn6dvWUtA0Z5T9XCpNwUs
	gMTLA0xEm0SLw2k3qJabgo3P9TBNXDih9b84j2q8NtjDIcWPgdzizQ5B4vPW+7A+AWAht2V4N2w
	Fhl6yRE+1OO/URBdeyKpF4C1+QI1MirEO9N6oNi+QLp8SC9Jf1bD0fjqRG4JLMEV/m6KiqLIM/s
	RJj9j1SncaQAOpH+ewNrheg0/50dbXPZSRizqURfOplIMLPCCKH2XhnD6fb4RymEDKzSqW7KmRN
	sAep5Rx
X-Received: by 2002:a05:6a00:cc5:b0:82a:7931:d3dd with SMTP id d2e1a72fcca58-82a7a8e9ffamr4767730b3a.22.1773991495003;
        Fri, 20 Mar 2026 00:24:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04222f42sm1452447b3a.61.2026.03.20.00.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:24:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/5] regulator: mt6359: cleanup and add supplies
Date: Fri, 20 Mar 2026 15:24:33 +0800
Message-ID: <20260320072440.2403318-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002456_009414_A31DBA56 
X-CRM114-Status: GOOD (  16.62  )
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

Hi,

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the MT6359 PMIC.

The MT6359 PMIC is similar to the MT6358 and MT6366 PMICs. I've done
cleanups for those in the past.

Patch 1 drops the restrictions on the regulator-name property from the
binding. The name of the supply rail ideally should match the design
schematics, not the PMIC's output name. The DT should be free to set
whatever name it needs.

Patch 2 drops the bogus vcn33_[12]_wifi regulator from the binding. The
two *real* VCN33 regulator outputs each have two enable bits that are
OR-ed together to control the output. This allowed WiFi and BT stacks
to separately control power output without coordination. Keep the
vcn33_[12]_bt regulator, as that is already referenced in existing
device trees.

Patch 3 adds the names of the power supply inputs to the binding.

Patch 4 implements the changes of the DT binding change in patch 2.

Patch 5 adds the supply names from the DT binding change in patch 3
to the regulator descriptions in the driver. This patch has a whole
bunch of checkpatch.pl warnings, but I wonder if it's because the
context size for checking complex macros is not large enough.

One part not yet covered in this series is the removal of the *_sshub
regulators. These are not actual regulators, but a set of separate
configurations to be used by the low power sensor hub or embedded
controller. How these combine with the standard set of configurations
set by the main processor is TBD.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (5):
  regulator: dt-bindings: mt6359: Drop regulator-name pattern
    restrictions
  regulator: dt-bindings: mt6359: Drop bogus vcn33_[12]_* split
    regulators
  regulator: dt-bindings: mt6359: Add regulator supplies
  regulator: mt6359: Drop bogus vcn33_[12]_* split regulators
  regulator: mt6359: Add regulator supply names

 .../bindings/regulator/mt6359-regulator.yaml  |  93 +++---
 drivers/regulator/mt6359-regulator.c          | 299 +++++++++++-------
 include/linux/regulator/mt6359-regulator.h    |   6 +-
 3 files changed, 224 insertions(+), 174 deletions(-)

-- 
2.53.0.959.g497ff81fa9-goog


