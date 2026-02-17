Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BFAE909A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 13:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wHG/p1ZM90BprQCvpdYjx62U8YBuCo5FIk6XXtohUYY=; b=XvKavkGonMDxpy
	/MPsk/B6ARYg9qtXxvwf8AFfYj+TDzwEJmv5bp9TsVK4PBoHqBcL4geNvgMeWYjLrMgb3fIihbJvo
	D9X8xlpHTdW6h8/rgRU2HpLe9ohW8pxvF72gEvYJZnGSYu6wPZKoivKH3kXMow86mEb3+RBNPKq3a
	vhcTfAbgYQ4mhsm88rnostgOwUeH2hPJuhlxApzZxVppR9qyhAC9KhmzO9+pznNI/6RTKlipptQzl
	htrWOFmlQ6DDMar38OtNZLRDAqGcBWGDK7tyf5d1CQ0tpG3jglUvVJgTiA2oDIe4co8+IqUlqJtMK
	68veUE/SH0by/5QjOmnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLIB-00000008LAZ-1kBJ;
	Tue, 17 Feb 2026 13:39:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsLI8-00000008L9z-2Y7o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 13:39:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H83iPH297034
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 13:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wHG/p1ZM90B
	prQCvpdYjx62U8YBuCo5FIk6XXtohUYY=; b=QR6T7LZqmmcJgr4HNw1BqizfsC8
	9y1yW0XDkj9VHdXAQl14kia6aFEt7dG40MlVO1kBiaNVwfh5FC/7hxx6JUgfQ5UA
	VgWUEovq43CYxUeRP2xJq4vO9fofWydydSATunkmu6kNSGaITP8kRgwODKLW2pdr
	XGXv2kHYLmi7yafJLpNlQ7IfB1yHR8QJsXrE+F2aoHtBTeFh8NcdtBvWp1zP3L3i
	Ky7rBCAPnuhdoWkhjOUULTZ2HUqsiUWFXAptb3WhZcClM/Ss79hVT+BONInWgfoj
	BytkNsEf9wN8Ly+9Kkun2n5ILpCe6oNqvvUt4y6NGLvuHsh7+nTDwEQqMEA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9thpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 13:39:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8243ae83898so1830156b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 05:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771335542; x=1771940342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHG/p1ZM90BprQCvpdYjx62U8YBuCo5FIk6XXtohUYY=;
        b=DqkBpwCLc39e2nzjToo9R7aSVJu1gKIJK360cG0LCRTsnHboVmQfhtJ2jOMNrWoGcJ
         EF2REuMo5gHuRYqwPT02XZDEF2hmGYFfZDLq8fVHRFSbuxsQugkqneV4KNosqMk0RKB4
         V3nQmjY2XzOAtf0LVU79Qe66PLqs5ayOk6lqPC9os38sdMTwXuF+X5TSCVQnMRkLrOdp
         F6CecB66rKfOHDb0tvFeEFoUDHjul/gEOws7S1St6rIh01iWYunyDg76G0iEEtjVxcZK
         7ydXiP7bvHzxK0WNKc+3zsQb5A6Ck80Zd3qGZOdskpT5E/DFwCC87yP2tzNW7w3J5JCx
         2USw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771335542; x=1771940342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wHG/p1ZM90BprQCvpdYjx62U8YBuCo5FIk6XXtohUYY=;
        b=h53JEKXOXj1o29Cl8uf7AyCkTCHsXoBHI6lmPCEQN4NglHhT7N0UEJnbLDQTDNKMt0
         iZPRskhip+EmWH19/dKb0MV8ND/O8Fsx9HgmHLt7AapaXRJr+TaOi2yYuISUfFC8ukP6
         tBiiObxiBQz10J67UierB4k+ZJabAa24o28SJtPkT27BVe2THGxXNyTzwxaFhZIo8njL
         LogLqYXf55tETkTLMM5Bic5yU31zMjltHiLDLFnm4z5f2R3tlxV5KKPoj29VCNXXqBqt
         OBtKT/UuVVnVPIaDTXmqvRlg0kO2YrOK1dUAPKgw4sGejzgAt/o6gTeknSIhpVzmaKSs
         hKEQ==
X-Gm-Message-State: AOJu0YxOx4PlcoySG2+PWjUMLiuBXMCvSehkV6KvLhRLlXZu2Mm1ICQV
	WZJ4Pu1BVlqCkSp5LPZxjde3eJsRe7UaRNymOeQ8U1CgVignxz6UjMOdE0KEBhlBME+JqtFsb9c
	h6yTfEFDIcbQLBsHXn0QfqxOHeTqV5WJJZwT0p7F2vyrDfUdytV/hNAyyAJ/BhTauDc24pPHJaR
	QdUZIb2DbG6w==
X-Gm-Gg: AZuq6aIlz/s6YUpFrHH8AZn1vTtlOrfZMAwyEsO51PsZ85BfbcmvebcW7zUHD7eQQtA
	MdomHlPsmVnTkYlXUQWPi0udVhYMpTBWQpxH2y8RmlUMwcv+xblKjvSzGPaptYaidd5dquIh6/a
	xHqpz+hkJM0zr0NRjjnZt1D2gyZ3qtEgr2xHVokj5rFRb1464TkkuvOheVAxPjj6mNx6XHymRqi
	wsxfdK8fqk4BCX83uHnt16bxj6it52xAKyNZtkDd4EzM0l0fxwRdwo4ogwm4X8KB9WYcXqapMXn
	//avDWvKoYJ9D0+FPrdLLzcBgh1HlUoS0TqK2Zt7zqbMRFAqWDZGPHEpeQlgBTC2aD9Y9dpyok7
	io9158++D3acEF2aWqzVGOUEGA2I4u3Pp8NZI+lqcIRFEu+N3YJ7f
X-Received: by 2002:a05:6a00:3919:b0:81f:15b2:21ea with SMTP id d2e1a72fcca58-824d95faaedmr9250201b3a.42.1771335542034;
        Tue, 17 Feb 2026 05:39:02 -0800 (PST)
X-Received: by 2002:a05:6a00:3919:b0:81f:15b2:21ea with SMTP id d2e1a72fcca58-824d95faaedmr9250179b3a.42.1771335541524;
        Tue, 17 Feb 2026 05:39:01 -0800 (PST)
Received: from hu-kshaikkh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b935c6sm14633207b3a.47.2026.02.17.05.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 05:39:01 -0800 (PST)
From: Khaja Hussain Shaik Khaji <khaja.khaji@oss.qualcomm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/2] arm64: kprobes: fix XOL preemption window
Date: Tue, 17 Feb 2026 19:08:53 +0530
Message-Id: <20260217133855.3142192-1-khaja.khaji@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
References: <20251106104955.2089268-1-khaja.khaji@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDExMCBTYWx0ZWRfXwIEmPM5XiI0p
 XzkUJX0TL+VyUW51DM1pGSPv0SUV4otoi5OvvyiGIuhsDJNNOHtKik/XCtwOdtYuSD1C9KAonWI
 hTjq/lxMeXytbHcKpyOK1jtGvPtkIrCV8/bh+V5rBX+yh1doqQnDTMuTUHWZ9EsaU/sBN94L/Ji
 KuR/5Nv69fSqvO4UB2hqkWBi9yynnJWnweVXkfvngD/bFOdi6ZvzfinSU7MsIkint7z5Yt1loVp
 LG+InAV9uoFRPvfj01lgcO4FzCS9E0NwBGQXUEe9OUKAoD2T0o4DomHihMTtRWM9LdI4O5Zr34j
 XqGexnn1ZkewpYxY9CM3Tda9UuDZ1oxVG9P+bUHlrp56W9/OXGIYMGTsj2hg5QljSv5oXwSruIU
 YE/LQqBTDjV5ZnfpWUw7D70HgTf6vuTOghCwngOpBwN+PoBpyGOg+vzBxk3/MddxtweAy8XyY7i
 25ceJ3S4Objq5oXdBUQ==
X-Proofpoint-GUID: DwAMQaZkqC15NiCobdGrZMdKkjGDqjtZ
X-Proofpoint-ORIG-GUID: DwAMQaZkqC15NiCobdGrZMdKkjGDqjtZ
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69946f77 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=_07oBJFWSMtGKjIRfaAA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_053904_767245_67C519F4 
X-CRM114-Status: GOOD (  14.49  )
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, dev.jain@arm.com, linux-kernel@vger.kernel.org, yang@os.amperecomputing.com, linux-arm-msm@vger.kernel.org, will@kernel.org, mhiramat@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Mark,

Thanks for the detailed analysis.

You're right that this is not BTI-specific. The underlying issue is that
XOL execution assumes per-CPU kprobe state remains intact across exception
return, which can be violated if execution is preempted or migrated
during the XOL window.

This v2 series addresses the root cause of kprobe crashes that the
previous BTI workaround addressed only indirectly: disable preemption
across the XOL instruction and re-enable it in the SS-BRK handler. This
ensures the XOL/SS-BRK pair executes on the same CPU and avoids corruption
of per-CPU kprobe state.

Regarding triggering: this was observed with kretprobes during long
stability runs (800+ hours on dwc3 paths), where XOL execution may be
preempted or migrated before the SS-BRK is handled, resulting in
incorrect per-CPU kprobe state.

This series leaves BTI handling unchanged and avoids emulating BTI as
NOP.

Khaja Hussain Shaik Khaji (2):
  arm64: kprobes: disable preemption across XOL single-step
  arm64: insn: drop NOP from steppable hint list

 arch/arm64/include/asm/insn.h      |  1 -
 arch/arm64/kernel/probes/kprobes.c | 13 +++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.34.1


