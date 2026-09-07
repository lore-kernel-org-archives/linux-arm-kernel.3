Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C41C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 11:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tO/GYw7p5YIziUo24tsiXtwALlKjEcO4Fmzh7zgI8c=; b=xywNhOOZc586oDMN9gGnGH9dJp
	Jz9MC89FDiIuD9PhIeXLln7ZNP2vS5aay9Lzl+PyX4ljq2Fp8ZUgJROVfXzf/xdXe3YbqiHXmKxcN
	gerq9DppcT9pATGFLk32M7Yb1Wg99Ci1pCqs03pOv4sLF+L61axgPOPQFtpDRElckaMLnAP16TNuf
	cdSjgSjsSBO0Tv8dk2L2h5ESrVps0GlpH9TJytQIpZfXy657TblNNesopoisj4gZLwVhW6LJmlVBj
	nr21A1Qo1KrxyqAUMNoeVkaNhagNGWhzPsQOLNM9sn/1LyscZRg18OjCNH/WH1tMCvSi6NH414bEw
	13GhR2BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XLt-00000006cay-2JY5;
	Mon, 07 Sep 2026 11:17:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XLo-00000006cYd-0lVB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 11:17:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmxPo3349063
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 11:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9tO/GYw7p5Y
	IziUo24tsiXtwALlKjEcO4Fmzh7zgI8c=; b=g8uy6qOQVIGVvsD2K6GsjaXCXFG
	r3Ui0eAvc91yHnD5W+GmiHJHMRvQcYZLnzqrMfjN38H4MrDFlfzeQPfmDWK41dO5
	nQQe1pYDQZW30w/eoJ/dXXVkHQh5kEVcx5Apm3QnlhDK6PQRz8wonyYxmQOvspux
	ER5MXktsOe5FXBNDy1gq3n///03usbWxWhZE+84soPMBxBogBXFN63WSsfl/4RrP
	bX3nf6KyqFQIEUqMYefKInvTnJeGzvQGhWb0lT2mu8YtWk27ziqOKnVMIvpIiVYD
	pEyz42YQtiuIVCSewASRTN5KcSUdBzZ6/9+egFztiKzeMDc8OF/THK5SFEw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0gn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 11:17:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e820609d9so570495885a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 04:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788779843; x=1789384643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tO/GYw7p5YIziUo24tsiXtwALlKjEcO4Fmzh7zgI8c=;
        b=egNTF1JrWEtIWJEBsrofaVOLBVgDOzfajNt08o4vvMDYvi8SAmokHBvuhZUQVNDp+L
         wutFaHA07Pv5ud/8TeJ6k5Z1UflSJLFgfR8l6BuPxnygcOSRbx1mzdHl95aSlK1G5b85
         dQ19J4RXoUmzGAGKF98ixSdBuHtadKN1O+e/hHA1v3X4wR2uz7lRxhaqM8Qay0C6y99W
         bg4efSeoCyrUVR7xN0+v3NgakAT9PDxYDhYTNapbGTm0HoYO30vEA/Jkw353SnToLAVC
         1Wy8q1vq2YWXYZHSPhq9juS9LnpLJkUB0DXGnTEGmNHlZBVK6ihuayP9INmt2+oC57rm
         pV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788779843; x=1789384643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tO/GYw7p5YIziUo24tsiXtwALlKjEcO4Fmzh7zgI8c=;
        b=ZfQczFkASwJKikGH9otT7NPfOMTyMUUZsfDK3UpVLn1afDeR+uXjo99rPHkDUojWWr
         fzQw6sHP/Yy/axSqiH4B38didptIkg+Bru476FUQq2VlPMrk3vVKg6TqfRDQG2Vf8zqE
         qmlK1kDBQwNJO1K33S7o5ojwKzjGwyrxt35S1QrPLchndnKu9U8VFyTKrCSgmT3VrFKO
         Ht1HN7aHht//vRqdxa+wB/3v7m9eWQ2QvBgnn2yh6urxoGiChT7puewBI0HrPasiE2zq
         NZFeXQWpkqckEh5Lt/K/lAmJ7hpKaMjyrgU2aNUr4UnQSNBsw6bZZlSzi3SiFKm+RuB9
         q7+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxSyPJ1QPk5BbTXG6P/+ljMZzltACtied90m/YJkF8M1WDQUMgk5+ktBHa5hNpguBirdRyjrlWyqehbEILmT7oe@lists.infradead.org
X-Gm-Message-State: AFuF++n/QDB3wHxBpZ+Lp2rT2g9g3/dz5nmnoY8UAv1zjvJHsE54s2TN
	slfMtSfDHA8+Jccq08jM9tojZBEpr/5u5RqmWNURVWzpc6fbUt+KYSbK5ubrveGHv6m1jsITYZ+
	sgITBh0toIlr+cxn2b2sD5Yt2h28L01NYHxcPxSEgtlT7noDWQHN4ckDquxY1fjHYVd5yGToOpM
	Apzw==
X-Gm-Gg: AYBFou1wrx6y6XZla1yrBroqox6lOCP0ZkKbrYTKUqpXxyesrYed3aHQXt4v9fQMU1A
	UPSGAuof0uAAWMC0ELDfelUgf6JIY5vFw1HLk/Zx0Zewwrj/qHJGA/BfnLxfhTINI/z+GLeeJqN
	zFd1wTFtbF04ZvmVFRvEmEhPS1fzPDEhhRWbseomhWCZywmC/8leTaEIydDYKyseO6UIsJWvFkR
	cMrBXw/769/bgnWDc0dOKyLd4q8xvugUczY+mCLn2Zsf2guzgE5LWQClJ4j4u3xjw8lfyyUZQi5
	dkI0YC+Ui1olDYQETJ8jljj8oxR1Et/vO01XZ2fBDXGoeU9pdY9LqobTWGNL+RdJPSVEAfgwcNR
	V9p7uAu+D3/ABKJZDa7R8JjXhIQql/GIStpIODLSbk7FZwiaPkWSnuYtkWw==
X-Received: by 2002:a05:620a:13d7:b0:92e:8405:7ad2 with SMTP id af79cd13be357-93980462eabmr1638326985a.41.1788779842736;
        Mon, 07 Sep 2026 04:17:22 -0700 (PDT)
X-Received: by 2002:a05:620a:13d7:b0:92e:8405:7ad2 with SMTP id af79cd13be357-93980462eabmr1638321085a.41.1788779842315;
        Mon, 07 Sep 2026 04:17:22 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5cfaa2sm456120066b.59.2026.09.07.04.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:17:21 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Dhruva Gole <goledhruva@gmail.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] cpuidle: psci: Move initialization a bit earlier in the boot sequence
Date: Mon,  7 Sep 2026 13:16:55 +0200
Message-ID: <20260907111659.263324-6-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
References: <20260907111659.263324-1-ulf.hansson@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9e9d43 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=lJEbMRRrfWY45v_ev9wA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: TAKefn-doCQjTVcPVixuRLJOkjTFeOJp
X-Proofpoint-ORIG-GUID: TAKefn-doCQjTVcPVixuRLJOkjTFeOJp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX38W3r4m6iOv5
 N/TclEckKbNadRrpSYD3ToMVz4mfWwfgBnnEEGTefGQkS2mJ3et4IIgNAZny+q7QbhmsWVyBMVl
 tGoW2JJNyme0JQ8vM7PzCIX1jTg70yc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyNCBTYWx0ZWRfX2jYK7I7fur/t
 zexdec3fh1ANcXxXc7YlzWzr5NPrdtiufdlvP8xUDow9ajIpMfXPyL8PwYW8k5uaNULiIch8GLW
 61Ka9HWNnrbElG7YZL6HKPIL3hcO8BRgaJ6hhnBDGFyCdaFoj3pTjpP+qKLA0WkhmWVdxxvBOtZ
 1Ryy0tGx4X1uF7mScIUBRqy2yi07fYXM3+gbeqv2+beBueHVZPRxtuDykaV/o9DleaxOrps2zjY
 3Wm7kbiRafIoNj4JTcIkQ/bKJWhwTHmBJO6U5oimrGKNRm1TGihPHp0Qylod2qh636CgcR59bcG
 D9IwtOTZfU2FYwLTklAZ2pTFRJbl1Zn2vkXKKzWjNm7WdIeNQ+/PsPODlMqgq2OYmWUwoelV6xU
 /dcHd8NiF3JQiF+496NiZcATJNY07uPnjWZVoUsbb7BVg53zQFH1rom+myLodXks0B9Fv9DiBlk
 M8zC3OLqnyNMNTFoYWw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_041724_228130_2F1EBA67 
X-CRM114-Status: GOOD (  17.16  )
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

When using PSCI OS-initiated mode along with the cpuidle-psci-domain driver
it's of great benefit to attach the CPU devices to their CPU PM domains as
soon as possible, as other non-CPU devices sharing the same PM domains
depends on it to allow their devices to be probed.

Let's therefore move to a subsys_initcall, which should be soon enough
after the cpuidle-psci-domain have initialized the PM domain topology.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Signed-off-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
---

Changes in v3:
	- None.
Changes in v2:
	- New patch.
---
 drivers/cpuidle/cpuidle-psci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index b250d0dde760..0187d6a9096a 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -479,4 +479,4 @@ static int __init psci_idle_init(void)
 
 	return 0;
 }
-device_initcall(psci_idle_init);
+subsys_initcall(psci_idle_init);
-- 
2.43.0


