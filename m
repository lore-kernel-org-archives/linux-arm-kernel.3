Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50637EB104E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 11:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4x8lVPTfI8gP2nq/1GJgFSF7/Q0HjBw1bkLIzc/Sv/E=; b=uzul+NaY95sOAt3LHMZMTX6xQl
	rj/AOh3LYveY/Noj7VRS/PHiCpCEjbRnPGS3MvMrOCO6G9Sl14LucK1clKadCnbI9gBO8oD8JaVUm
	F0hud4npdbV1pjqqMfyyfxDSl5FONg68m5LCwNXDCfbGk7UK+cqQh+SPcL0r6aQ/chHp+CIeB46yK
	xR55VEpQzk2HwSuTAk2nh1AZ36oW5o63FQ9AGP6FIDTe4CAUSgTIY1kGSGYbdpFAvPPusM/XZHlXX
	cyz3TjAo53d7LBnr5Zp/z2nhQOfmjXVvlIO/opfkTfwT4EvE3QpgCXZxzZiKR1QzixA/3OKxBJqJc
	LEk0gm7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvB3-00000009HRf-3A61;
	Tue, 10 Mar 2026 11:23:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAx-00000009HK0-0Ybu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 11:23:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A6VZfO2021721
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:22:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4x8lVPTfI8gP2nq/1GJgFSF7/Q0HjBw1bkLIzc/Sv/E=; b=gvghw8DNIsAi2ZOW
	rSW3aAU2unXfvpyObviRS6XiDeTA4dtbT3T8AsX+/MCVGS7NNm8/S6Kt7+zM4UHH
	KbGKQm6ax7UUTaOwTgseEP7SYCNxz3rqgTBj8u648oCj1w8Ktm06wF6HHSAAqtdV
	QQ19c+3P5HAUkoycF4YYSERRzcwPvkRAxySGr9+gl/qm1+Z8+Kk1LThEikRfiJ7B
	r/PV77TMO9kVLDtNGcg2MZvaPtq/LTufVj24bCq4kGIU65RR/UxuNofAEfxxay/m
	wDD8wQYZ+n4RYD9iqm7d4XZrQ9X3QKFsLNQWXCTT1tthpouMwJKp9qiUEvhM2csr
	fT3TkA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cte3w933p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:22:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509114d7418so17113631cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 04:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141778; x=1773746578; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4x8lVPTfI8gP2nq/1GJgFSF7/Q0HjBw1bkLIzc/Sv/E=;
        b=MFtfHlWm/XdO+Vs9Ry/lP9/VQyXzKVHsQmFlpC/wMDDrHdUghEAyIlH4+P3+dZYWt9
         V3SiIGIBNR947JmTN1JHr3NNW3CMofrGq8FtxU5O1boHBrmDFMX5kU794WqxucDUUcbV
         5tGVfnppuy/7GNeD5UGbgpT2jnPcuGRx49lbn9mxJM0YISzmJhMXndIM0MYR1JeOY6+/
         Sd1XfaFS5ECbEXEi0racNS2fUNA5B7arTPbGxmi+SJ1Uc8kZilUBkIDJ6cJogECIFENr
         ULSWAY7yfiE4MonQuWjGn6TMNcVIzD1cYIC08bkFvfyWwMlw1nKcRLMl0tTlvTKzjEC2
         7NyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141778; x=1773746578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4x8lVPTfI8gP2nq/1GJgFSF7/Q0HjBw1bkLIzc/Sv/E=;
        b=fACvdLHuYLIGHWyhLsyPwxlobwKXreXbThv7EZL+qoucLJQEH1gYMUd6sFm2+qRSc9
         Sfx8OGeMStx4yKdlwv6agwQnM4UGs3n2h3I/ksmPsG8MY9syUrkJCvWVfk7oshG/2Iyv
         pcTrgKPGgXgE5mWCA8fIfcsZFvTZWLLMSusEttJAyMPlkWoCse46qfzojOyzrebqYaky
         r+ZWGbj/QT7HEiFuSyva+rn8VpLst0vFFEWCp4DJptFJbLHbGMj6DGZfDLsIMgT6sF07
         KTdziZAJq3txUzcZIzDT/Th1dgPgW1HXSfjwnG7lyKZu4Bu+FaH7lZgS9mh9a88ZzuQE
         iQUw==
X-Forwarded-Encrypted: i=1; AJvYcCVYXSypByTLABB8Nf5Jx6SKRpV5vEh0HuPR2wB3UfC6mVcsgVyEZiF+bCbcx6Fx2kl7IXqczWO0saK/u5B0i5l+@lists.infradead.org
X-Gm-Message-State: AOJu0YxWVrvAPsyvHqXZ+KK9gUW87bQ5d4/mZo1EKP97pPvC0c6zVwHD
	OYy41rF7Wsm52pLrG+ZFlsuxdeadoDH9bGjdpveMnCBa11I+WYiAaXCgAmvxWCJS92uygdKGZai
	GVtzOi7F2KaSF7dsQF+IWG1e20uhHe12x48UpcnqUNM59eYdSdezx1JUbaB7PS3GzP1VniMZQjq
	xwng==
X-Gm-Gg: ATEYQzztuC6LKO+wnWSxqMXvqvoSMRhfYC0leF7p9HoqfBoye2qT7bX2N5fgMYsBJR7
	d+Mjh+t1liRbTy3sUPNeYj66ZBwa1Hz/Ia4l+DpsSchHcjkcp+Syte9RR+dx5wCCI1pmRitEeqO
	MMPQHi/fnLqaVeCw8qDCpVMrinh8TP5Ry4eWa9ZeDAbTm2E5xMao+gGz8auvDF2gF3B2E6QGc15
	7mMLV7JIV623xsRZS9fiTkEBM0GJ6D7Zf/xg8AosVuzBJ5yMvwTRyCk8zh+Fa7Tn5Tw8rJ9BnAV
	SlKclW1qoPzShX7R0BtA2LO4WHxpuKQo3XZKtLEYtYuk24mcS0QlJDsf4ip2iqKKjqwMh9gHONz
	puRiHh8hMZUkLWPBoz6rvK4AX7aLfHGsGlU+s2Cxy1sOe
X-Received: by 2002:a05:622a:1456:b0:509:219f:8e35 with SMTP id d75a77b69052e-509219f951amr49609951cf.42.1773141777614;
        Tue, 10 Mar 2026 04:22:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1456:b0:509:219f:8e35 with SMTP id d75a77b69052e-509219f951amr49609561cf.42.1773141777135;
        Tue, 10 Mar 2026 04:22:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:39 +0100
Subject: [PATCH v2 5/5] media: platform: mtk-mdp3: Constify buffer passed
 to mdp_vpu_sendmsg()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-5-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1016;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PYQfNbJhq08lhf8pSFWFUAIROg8/q1W+1h6VJZjWmOI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/8Ctq9UEeQlkwgbYOvBN1J0NS/LKB7qV4njw
 JU8skMasvGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa//AgAKCRDBN2bmhouD
 1774D/9uW5xrt8/+RUVSYosRDY2s6mNxQs5JaiEfldKJ+p1+reJ9wftn3leur1dOdwHj/pB3F9A
 jOJIbwcWDRi4xx/mNWXP5Hv2xSEBxQOcf0sfrwWcK8LroDj6wlzCOxbOvuhxrfvltkttgQ14t03
 U3zs9fbzvPxeEASE1aWA0d3S5va6WP9xo42jJeOovTbPAY79OwFBoFeRrALnvVy6NxOerxKOeGQ
 5lBuAzESo+KyhCSJUv858+bItSk7gcTzAJspq73LPE6peIEYsHDuicNoHnJYH10E4HBS7nktFx9
 IyONmGVnKGA+eWGC4bh74oYTC1f1gj1COyvrzK2sHh6TvLIksPRy3KZBFHUFTYKc2V9n74ypweX
 mkivKhKMRyMxmsR/xoxKrOmTs6pbC5qM3bonRCgksg+e6Xa1GittEa5ta6/CJ1lF+e1TBq3jJhb
 bti70QpBkAPodaPfwDZhfmeCIdC4U4RdXkQb20tRu4H+bSE4k7c+kytacurPBtGm8w2CXCvRJyR
 KOm0hEFxtR3+n1gzbECyPMgHwj1KRsz297+3oq/56L7lZVaIq2TDOD+/T7H+LXQAa5Vds6WuxCh
 eiCnDXDKS+yIdOH5I9wBB6q/thrp3foV5UQ0aBDk/YGwhhfGRM9mErhiUyj9MpWlNRKuwsH/+C4
 d2Tmexu7aWpZaUQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfXwZ9lAGRLqvnO
 tg1BDUl+kilL37Kxh+bhE2n7VVvkd1HoxR4qoFrNGSxrFhsi0dvn5FYgY7YBrkfjOHSFqk1BEVG
 DKeZbeMLBg9HcYvUZkO8mW/rbDnE06KMiOLaFULqb1Bd9/PNtQWZ0X3BF5uSDI5dqd6SVgHkh8r
 LMKC260dc4HrlgdB9Loz9s8vAhd0JgK8jInKNMQnXSd5bfYyRmu22bnE4t3MwH1HLhrYFKXsfzK
 xHW6saAUEl8jyHRRJbc/0eM4xA/OCwYLIBkBPVyCNZTfh4QypPQ4gPEqmDjLzCu8PScQnCogfZM
 P4XsngFLzcytprnJQ93mZREihqP5l6kMmCF/JqR8/l8wvNSTouVEBprc2OD5joTy3f3zTuYrMCg
 OHQCy7Sf4zTMsxjWkrbfU2KJPugGs10j06Pgch5fctUJznWsEV0JQTBCR4uhtdT3hxPGg09uOxI
 Jjd636AUpoClB7hgMdA==
X-Authority-Analysis: v=2.4 cv=GtFPO01C c=1 sm=1 tr=0 ts=69afff12 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=07eiXoGdt8lw6NVwCNwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Wqgot8832q9jTAJGsNFwdroCjxPJ8nsP
X-Proofpoint-GUID: Wqgot8832q9jTAJGsNFwdroCjxPJ8nsP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_042259_181384_749CB735 
X-CRM114-Status: GOOD (  17.08  )
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

mdp_vpu_sendmsg() passes the buffer to scp_ipi_send(), which takes now
pointer to const, so adjust this interface as well for increased code
safety and code readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on the first patch.
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index fae3e1ad2df7..67f3001153ae 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -163,7 +163,7 @@ void mdp_vpu_unregister(struct mdp_dev *mdp)
 }
 
 static int mdp_vpu_sendmsg(struct mdp_vpu_dev *vpu, enum scp_ipi_id id,
-			   void *buf, unsigned int len)
+			   const void *buf, unsigned int len)
 {
 	struct mdp_dev *mdp = vpu_to_mdp(vpu);
 	unsigned int t = MDP_VPU_MESSAGE_TIMEOUT;

-- 
2.51.0


