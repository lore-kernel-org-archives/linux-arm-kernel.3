Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92686E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7t8tuWm57sLbbvF9Is8tIuafHTVg4xWgJ7ckN7IcKD8=; b=sWRPKWDMppt0NRnzcfodOK45pf
	jZi30nKOzdcoN6pPHX2h59+1qT9qP6zULjpPmP5dcdleu4kFJTVqchrx3Oj1vSgcyGrm5C2ZPgQUL
	tLeXLOhuHQYRYgDdjQp0E1gbeIBfxyD9OywCFshcLfIk1tbkjAFzVkXfCCNH1wTMjlGV82I4JpdMB
	9dqnBOH+Ip+xJ0OObAVxxdbSJbhNT+v3Hv61Cd16bTDFclINPe9Px46yflGtxrLTltulk/jNhDajS
	K55VKfJUUoVAFajlW3gwpZ2wtMUbha1JLlqp1CFQfsOvifrr+uumeVvEJ/SFDAI71Y1l4NGo+Ytbk
	drl5yDjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhq8-00000008mP7-0FCx;
	Mon, 09 Dec 2024 17:46:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhp0-00000008m37-1XVH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:45:27 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7259d6ae0c8so3922235b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 09:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733766325; x=1734371125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7t8tuWm57sLbbvF9Is8tIuafHTVg4xWgJ7ckN7IcKD8=;
        b=aiBlrp2ESrYQYyDy1Q2VG3OYwdsj3j202nyr77y7YnhWEiAu8MU2q5D2r7NsvVFijR
         NjMDv6jHSbZKtpphG9FSggNZVieCZgYxMiQ/QggQFZp0bPUFX116KwTpn75qNHmSKPDq
         xRMllgtS+jwhxGvVbYRERQN4gIjfr2nmQWAEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733766325; x=1734371125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7t8tuWm57sLbbvF9Is8tIuafHTVg4xWgJ7ckN7IcKD8=;
        b=YExdjtWmdXDpHxpe36ctRTc1r/2J/3wO/lHGGUaZvW9QwJARkX54w03QarfXsEaAMW
         6zbPY2KGtmSnw96cCET6IDzL8WwhrH4IvF+rMEIsrqr0Cye020rFf2LrMlLEOCXfrah6
         6nlQ2PGxhKrhtKr6AXc0BNAWjaQoKvTF+wfcnUmWriFJJiX/wzDeOdE128m6pShjSuCe
         joNI8XHSwZUaPF0fCiutePZN+Uw9hZTb1rcLUW9klx9ZLxcDDT+C/EhEfeQAyIqr/bHV
         C21pAIo6ixj9DKfhrOYowe85QtpOZzGa4E2CLaK7NQ11CtlEUd9z+FRRM5vOHAbyglzs
         o4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYpLU9XcIX9rii7VL4TPZ9tKcr6d1usEoJifhyBhJgN2oHpkoU5MPNE13rfsjJZm5qVRMIYGwdb/6GNv619/0u@lists.infradead.org
X-Gm-Message-State: AOJu0YylZNOx7+UHoUc+z082Ku3JJskdvPp4XBxTbch2AZBOIZkHHILi
	oT8gXPVuPKSkWqERWN7cvxXOR/iGKJxHji9TidlFAtcXaMmomgFcExCzpLl4DQ==
X-Gm-Gg: ASbGnct8pL/lXaXxbTumBBPQ7Z9Vjnk/2kTshyhhzhxdjNKB1VdDpLS/BHX/fQ6/LUl
	eettT79bUS4dJ7j/aiBgVkwewCErbvO+XajrCMKA3Uh4vCbXnYU/pyzYizPxZH2NfDi4rlML+qO
	o7KaTUKmMR7B8q3rSvmgHHDroQBpXx7MbqONbQDA/758BTMPc9SvNS6rJNXdolmwrx8DaMTNmuY
	IDf/5X+SvIiq4u1+rZv+bRdDxLOqlYHf8GLEMlzAET5taEjzZbDm4bAuHKFBayMjSFL2m5lQg==
X-Google-Smtp-Source: AGHT+IG6QqGCciHu5uQwZvPGklBSE2Qs6v3qJYcrRCySA8PDMw81hd4m8jVC00rw+U2ObdTU7EE9Fg==
X-Received: by 2002:a05:6a21:6d98:b0:1e1:ae4a:1d48 with SMTP id adf61e73a8af0-1e1ae4a217dmr3942870637.40.1733766325252;
        Mon, 09 Dec 2024 09:45:25 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:5dfc:4b08:57c5:2948])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd53ff4900sm1397667a12.50.2024.12.09.09.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 09:45:24 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Julius Werner <jwerner@chromium.org>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	Trilok Soni <quic_tsoni@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] arm64: errata: Add Qualcomm CPUs to the Spectre mitigation lists
Date: Mon,  9 Dec 2024 09:43:10 -0800
Message-ID: <20241209174430.2904353-1-dianders@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_094526_421350_6D1617E6 
X-CRM114-Status: GOOD (  11.37  )
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


Since Qualcomm CPUs are all derivatives of ARM cores they all have
unique MIDR values. This means that the tables listing necessary
Spectre mitigations need special entries for them. However, those
entries are not present and that means that some Spectre mitigations
are lacking for Qualcomm CPUs.

I've made an attempt at **GUESSING** what the right patches should be
to enable mitigations for Qualcomm CPUs. This is mostly me searching
the web to figure out what ARM cores various Qualcomm cores are based
off of.

These patches get more and more sketchy as the series progresses and I
have noted that the later patces DON'T EVEN COMPILE. I have included
them to make it obvious that I think these cores are affected even if
I don't have all the right information to mitigate them. Hopefully
Qualcomm can come and fix this mess for me.

I'll note that I am certainly no expert on Spectre. Mostly I ended up
here running `lscpu` on a device and noticing that it thought that it
wasn't affected by Spectre v2 when I thought it was.


Douglas Anderson (6):
  arm64: errata: Add QCOM_KRYO_4XX_GOLD to the spectre_bhb_k24_list
  arm64: errata: Add QCOM_KRYO_2XX_GOLD to the
    spectre_bhb_firmware_mitigated_list
  arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
  arm64: errata: Add QCOM_KRYO_3XX_GOLD to the
    spectre_bhb_firmware_mitigated_list
  arm64: errata: Add QCOM_KRYO_5XX_GOLD to the spectre_bhb_k24_list
  arm64: errata: Add QCOM_KRYO_6XX_GOLD/PRIME to the
    spectre_bhb_k32_list

 arch/arm64/include/asm/cputype.h | 2 ++
 arch/arm64/kernel/proton-pack.c  | 6 ++++++
 2 files changed, 8 insertions(+)

-- 
2.47.0.338.g60cca15819-goog


