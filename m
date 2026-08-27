Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63428C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4/+pFI9X3x+m5kaMfH/DHqftGBwKmr5KIRwmuCGmb8=; b=PdlOahzW7/wShiJaRNt2Y3YtGQ
	4sICxZyS8nfVx1z1vOVW4jKLCnzVYFe7aH/bRY5QuAlu/4BF3Iog+oSaz9s31+JdE4O3iFrO4+SrE
	9C0nbcpw76ER118+Pkx9zffxkKSZAxsV/d+MY+ZB2PKzVsWaC8bWPq2n+DxkQcuCa2rlDCN8Okur9
	t34K27W/zJ4wIOxjW5Oc8XqFgmLcS9ZkOEfxht5EikFvW1hj2EF+gIqHUky27ye7QNt21Mw1q8o0a
	rn4/EZxEtFdg8JWbqPysUMBvSCz2OyDqXPfa2eH+O7NL8jQWDjsvbUCEvFE073rXtXMkZQ0h0/LfZ
	Y4KjMhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeOH-00000004XY1-2tiu;
	Thu, 27 Aug 2026 17:59:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeO6-00000004XQP-1PvX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:59:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXeSc873740
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:59:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4/+pFI9X3x+m5kaMfH/DHqftGBwKmr5KIRwmuCGmb8=; b=bMxcVnYhfYd5fNEJ
	rjG+jRjG+rFtOUYWo+LAzlLiR6RK+WHe7LOHYhSaras3OG4qk9JcGO9wSJE5hMFz
	o9Pi/cBz13QNhoCkGlOwrxBAnLpqnaSHr86X8hbXklfdqPBoJOTYnevWJNCPTEgn
	G8jXN2Lg66YzXlQOBm5PYnma7vw0zSqzy7s7IFPM5K58NCHX0S8BnxfCh1eUTpqB
	girVzr+TzWRbg/fDnPb8A0AoYdkk8qiP/FwHM0/Wo3QzgNzGlLmvRbJgaxghydqK
	cVz3EHEatSVQll7TuHE6YEQJSvLTrdQBkwVMVQbvXr9n2rowYXVveM9RrawiXxnY
	W3pifA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garn0gj7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:59:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso347312a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853580; x=1788458380; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d4/+pFI9X3x+m5kaMfH/DHqftGBwKmr5KIRwmuCGmb8=;
        b=UamFPrHkbJvt2f7TcslGvrfTGyo8w5cu1R2Y56UvraGOZATEmPIsDA1WIOhlEjOAcg
         RgYwaPH374KosCh6/uQVeJPc/W6Ch+BMCVNZxessawoyy/22G7hyrV53uDz4QS2ihHCP
         x5lImtusSp5XWT/y1GoOS3udpbASs3Cs6U5GaMr94tgKnGUulNPrftDKWP9TL5g9zuFZ
         9IZ/p6oQWeCNXgOzYV1MyQI25ABbDi1G4gIUPwPNBYh5h0XQEsAKpW7P7pd5kGH4G95E
         whR/BvgsJT4G8jB38Zse36i+qZ9i3ia2fPneFBVYBf/pqaFDS7QL5w+ABe9mm16XpWof
         1MBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853580; x=1788458380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d4/+pFI9X3x+m5kaMfH/DHqftGBwKmr5KIRwmuCGmb8=;
        b=SaFem7n2Gn5U39X/6ZFwZ1H77p8D9bFO8fpV/kJy0OAyaFcNFDvMzQLGOBEzW2kzJx
         W46r4mpa6dyBLoONKEPFCA10IMQcS+OARUwTR6eo+MOrR3vmWVtzJ7v12jtBDQR6OZLl
         eeUrE5BTMP7Kw4qGl/NdNRYW42X21lM0Zer0NJX6gjN71ZkxxkqLx0rueDHdlQ/pqqFF
         hGZijPgnNwE85ry5LXvpNp+y0/jtOmZlPlN92aRtQmPlZ4TOCPgCpc6oXE88XYT/54vM
         up2YwzociSLJxDwOL9A6G3W5B5bBv8JiGIuMCWqAcoDLah2/qxM7mzTNTxFJzzzCLFHY
         bz6g==
X-Forwarded-Encrypted: i=1; AHgh+RpXTiX1BeoG66R6/BogSyuT9JIaYgl1y3TyOCJKYvapnDqYpWqwx7ZpDFeioQ7PuqWRTiUuouCYarng6ZW5tXad@lists.infradead.org
X-Gm-Message-State: AFuF++kkw/80S5BkhGRGeUztHM4NhL64HmdQ0A+Syn3z1Vl5fNXp/U4Y
	1MnyJ6BA9sgnLEmk7oulD++Yy8iujVkMAZarFGClmzwcMysYpLY9LUTl0cH5Ic57B2znz/9ugOS
	BZG70mW7klsRoZzOefSMriGsKEV8/pVEuDBnKq5ae2fc4GhODkWYwMK715K9Iof+3RAoDNcPslM
	WUGA==
X-Gm-Gg: AR+sD10XuIYAwm/Z1b1Naq/Lb0igOLh651tNRMnXp0kPiUom9n2ms7YxpHn/0C0JtOX
	xOFqPVdqcJGCEDxbzotoexNHzZT0dBrGtpzUCCZQt8MJlul1drblF1pR5Odh1lkVFOoqTJF0myz
	9R+vaoH8hji10cv+9h6d5Oxrf6MTDJgdD6BtpuAYNb4ynorRKKZ5hmXKR8LQHSk0qxlZrGZKLfk
	nE1OdV6l5d1DwpT4z6QowkjoId+1nuF0k03WjbYUq/5yHvRjzpV9zMR8HHBs9ATXZFvp/wf/4Lj
	DnZTvO7EAMJQ+DRBLZzovXrObKxjZhX3VGCvxnGagQGGmXIrC9Ro2j8+Rn3Gqp7z20SZTZ83SCQ
	4NZS62kysHNsdFWANIjYlld1uicWzxGgXdw==
X-Received: by 2002:a17:90a:dfcc:b0:380:f389:447b with SMTP id 98e67ed59e1d1-396d0fd3a24mr1900898a91.11.1787853580261;
        Thu, 27 Aug 2026 10:59:40 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcc:b0:380:f389:447b with SMTP id 98e67ed59e1d1-396d0fd3a24mr1900802a91.11.1787853579715;
        Thu, 27 Aug 2026 10:59:39 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm27437523c88.12.2026.08.27.10.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:59:39 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:29:18 +0530
Subject: [PATCH v2 1/9] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-1-091697dbeb02@oss.qualcomm.com>
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853566; l=1380;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=GuJ2IiTNAbocaQLtHQ5QQk1lc6LqRCoanYaY2qkKLA8=;
 b=uHr3/INLh9B6c1OSy+HkMvDYKMGogOjcbm6b+zN0jVzPu8xWpULGobB+nh9HS0n4stNuFMgOJ
 VBVVR+W8kmCB6yTAsu4IqWK8QP4Z1T4YLzVn1c50MlZWoGiWls+ogiQ
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX5nTYp5FTXuJw
 f/HNor++Hlo0C97tti8zTaJzVbNjEAV11NFBX2Be1+d3pZ7g9fgUYo9muz1ZRo1/q5BqLd/cc3L
 4pMjWC4+/UTC4pzIqpPR59uqcd12BSK1ysuakf9muYzcdGDc3EERfzSyvim2nBVzMwo2pg+D+Nc
 vd6eL4P4+GRdLdwf+BaYRAgGhTBgk4MHo8DQjZPs2JyzcNAQT/jHpwkeksQ1F5UzOmCCqWDsjOm
 kWfT/1fMBEhTTojCm0msVZp2kXnXndeu5nW8MhmkKLSYC9q4udSAPlZRJo8ZKYQnqXf9xOFlSIP
 u3PXZ/7+VzV0vANAhGUcV4GP4VPcXwIwugDD51dysQzlafSgAYokvIxERKNRzIC3LM46unNeGfj
 xIL6V+aVhsRj9KyGEGFvxKAQN3/J/CLWjnr6NygOsj1rB45t+oPigpUm8WmS04JOmttuu73o/na
 2D+8xVi+sobzWRY1srA==
X-Proofpoint-GUID: jzLeot6hym0xmhqRVh9WU5WcWmsxxe22
X-Authority-Analysis: v=2.4 cv=C+3ZDwP+ c=1 sm=1 tr=0 ts=6a907b0d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=sIx0R2CjXXeYvnaWutoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: jzLeot6hym0xmhqRVh9WU5WcWmsxxe22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX3xhqXmQmjcJ+
 5twTG3g5lGl26S/VngPpPRjZcRz3EEYkA++OQ9v1Qr9m/wV73d50daJ81iBHree6fxhA3AXG4nV
 8dzYknYBb3Wg8BpFgh4vjvVukpKRY+o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105942_518352_282F2FB4 
X-CRM114-Status: GOOD (  16.34  )
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

Currently, scmi_pd_set_perf_state() treats a performance state of 0 as
invalid and returns -EINVAL. As a result, devices attached to SCMI
performance domains can report failures when relinquishing their
performance vote.

The OPP framework use performance state 0 to indicate that no performance
vote is required. For example, dev_pm_opp_set_rate(dev, 0) is commonly
used (by firmware or linux)  when a device is runtime suspended.

A zero performance state does not require any SCMI performance request
to be sent. Treat it as a no-op and return success instead of reporting
an error.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/arm/scmi_perf_domain.c
index 3693423459c9..e390f902a444 100644
--- a/drivers/pmdomain/arm/scmi_perf_domain.c
+++ b/drivers/pmdomain/arm/scmi_perf_domain.c
@@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genpd, unsigned int state)
 		return 0;
 
 	if (!state)
-		return -EINVAL;
+		return 0;
 
 	ret = pd->perf_ops->level_set(pd->ph, pd->domain_id, state, false);
 	if (ret)

-- 
2.34.1


