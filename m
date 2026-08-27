Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4D9C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 18:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqu+QcbOtbM8Rimddb61w33ixiI0vj6whMYuEwbL0po=; b=qbgKVA/nv294eL/E3+0yHzSF/0
	Icy49zvj/x9A8Vqr5cyH3o4BE2ohX1Qd4jr5swx50eOLm33PsXicyAaM4WIPKMFo1LxkonbKUhM7g
	ykY5u6P3bs1JXaw3UQdvqOmPCC/XaDa35cLz0k48rL6VItBGJfsmxjgJAtFEYE9R9/mxrsoOiX4qw
	nLT07vang0jwoB2MJVe+AgfK9qkw5HurEGT81mO+cp5pYz6ZnNLzk054tHXZnwvB6mFdaoxFYn7RJ
	IhDMh0IB+Y2o7fp3y/6xu9yptjdKKVkaOPf3JW/quHIvUXFrHsnwYAqVBZIDtyzTEvq8iY4I7Qd+W
	HnVuU86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeOH-00000004XYK-3gau;
	Thu, 27 Aug 2026 17:59:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeOC-00000004XUs-44V2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:59:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXdlr313736
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iqu+QcbOtbM8Rimddb61w33ixiI0vj6whMYuEwbL0po=; b=XpmrNDUrTP07n6Om
	zBk1IGwXBnu3yb6XzL2oGK7gsqtUKCn6hDgZyCHHa7L5FhB/hQj3Nv1jb7iQrrzc
	1sA39PPj2avc4zoUd1+AqtAYOghG335Xec0aadP6pH5ylM8IGqxx0bk0RBuHe/Mq
	NF0fQaRf8nWdCrOLWyg26rbTv8CuOBxtiZdh6oYgIFPt59lqWaywE0xV3iZHd3gN
	4rBZGHoAKI15tzYYyKgx2xn/UrNbV9pI8hrrENjTdKkKlMkXS17y8oPLCKY5Uyn1
	rRQ3sYupp9dbf2YMGE/xvwJNkYee1Turn3TvMRFnAc4w4i0aFS2qk7W1BnZ6PInG
	YwQBDA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gak561x28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:59:47 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso347438a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853587; x=1788458387; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iqu+QcbOtbM8Rimddb61w33ixiI0vj6whMYuEwbL0po=;
        b=XPm39oWQrx6J6OI7g0fiaLvYygRpOo8TcndcwvCO1TBpLyiTaNK7jZW9oxwU8YFbON
         +Xp3MnpkV7uOp2iYKWRSvGZk1pjANMpwMll1sckPL5WzXgXbKpeCIXWQzSyQe8xT0CJH
         cW1+S7lVMohcuB/L1ZMsSfXY8hh65D1t0jrxhRPOv16ithstWl1lRs8Ad9okYUEAko0s
         23IOl5wlZoJlzOM4JqvRIQkQUmHAiHCnrQvwUNVuRPrPQZQEtuH7q+QdY/g5yuClk/Ao
         zb9zB7nmumJ4arphod6e262phHI+8m6Fx+NCapUy+JamLJ18kxM4xs/5ZK9edUePBscn
         gAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853587; x=1788458387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iqu+QcbOtbM8Rimddb61w33ixiI0vj6whMYuEwbL0po=;
        b=W08kAJCgTmOPDQUno9CpbOnBWw2oyyLY9nXlmF0QdznqjxxwwPrBmkxK4sKsCR0V7+
         Uim8TCvfcDM6to3NQQIjbOMJAUoaK8uTdyEVsicB78WP2DrXPXd5Mk1UCRayttgO/8sN
         yauOtBZ4uQGYjTOGGKZX+m23uCmJ90vXxUaVamfXsAWPydOno+zIi/zQ9xU2/ZpwflQV
         x5IOJkm7STLzUJUV/klqMLHYttsXskF+rtzibt+itYCZLRiBeKKGHWCJciDjylooQlcy
         BHffagbIshkRla7f37GQCZaimHnJo7aFSkgEpSxaBFFNe0Zv6surUbi+m+Bv01lnncRn
         ztwg==
X-Forwarded-Encrypted: i=1; AHgh+Rp9H0p0umKSs+aIfDHDyQMpzXKGBtVSUzBS+GcwXBbui2SI0EQ5lKU82c4d+1NlRKCHV04c0l60FhHSDlK6u/yh@lists.infradead.org
X-Gm-Message-State: AFuF++mlPMBnRWbhA/n/9aQk15bchRmg7kKqxaDB8PlysKw8U0Q1gllC
	jwZ+crIUor1crlHIaWhneO9HHqKkjIcHjLPvWZO3aMKB98GXrSojkbma1WBPZecud+5efgmBUM0
	I8Sik0lvjwrNyMkkDOgYPyWHTVb7CZungxCjsCJG4LP1nNQgqKdJUGLFORT5dLmNVV9epsOLGnE
	wHKg==
X-Gm-Gg: AR+sD10CImzDSWk2EGyqfdtrQRKbpRrcWYYYFNkuDvN3ZsGAQ5boegLAMllVjCGajU8
	urznaT6p11rsfqVrarEChYmnbA1Gub0sLDjfEmGfKqazKklQQ8lQOqOdB3i3svN//ti4xLzTPy1
	gb1lBqGJBu+PDNntZDt6ZocM8PIvfmQfI6tKnBPiAnAcQhtrlzPbhBHzVpweSXnSzWNcSDzTY7p
	y6m4Q8rW7b0DhTOAOVFWVwWexHxfQ/tH3TDbeHhg6JIYd3UwPSZ5kLM6ka+AwgHSMwqF2gfLgMU
	078S7yadql5T2icL+9dTR3l92ZfdxLbPUPKAjkcLAoyJqoLbi7ZmhGm/aExi2YbYNYf9/AOq7tH
	ASOvgzGr9qpQ7v/Rry7xMzXfNghAORwSKbQ==
X-Received: by 2002:a17:90b:380b:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-396d0f2391cmr1736491a91.7.1787853586847;
        Thu, 27 Aug 2026 10:59:46 -0700 (PDT)
X-Received: by 2002:a17:90b:380b:b0:380:f85c:94b4 with SMTP id 98e67ed59e1d1-396d0f2391cmr1736384a91.7.1787853586253;
        Thu, 27 Aug 2026 10:59:46 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm27437523c88.12.2026.08.27.10.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:59:45 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:29:19 +0530
Subject: [PATCH v2 2/9] soc: qcom: geni-se: Populate clk_perf_tbl with SE
 source clock frequencies from perf OPP table
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-2-091697dbeb02@oss.qualcomm.com>
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
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853566; l=3349;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=AdwimWmojgUMjxZge10azUFM2Iq4ZF78vSGW37hlcsY=;
 b=xDUNaR1wqkINGiOInqWE2jn/v+OQHLBDBZ+Fh1roliGz9vW+grwzgz+g46Wp/y3TBYYP/MmbW
 uAIRm9TQvphA1WS8qhacIvgyjp2JvGqodTTkFyYqG2IdHsmXGD2eSj6
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXwRVffEyJ4ouh
 yHllGo/zem9Vr33PjG//UPxqewgwQJ4nDtgVyDUJTM75DrhZJdxl01H2jpfRrmsJytGz/xtXjjC
 ITJSNKepJQ35hggxRFzMVLeeNu0GzPw=
X-Proofpoint-ORIG-GUID: qiNPYtYWCf03FLJTVJjXki5ef15V_bPR
X-Proofpoint-GUID: qiNPYtYWCf03FLJTVJjXki5ef15V_bPR
X-Authority-Analysis: v=2.4 cv=G+Ms1dk5 c=1 sm=1 tr=0 ts=6a907b13 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CVJBOM8IPza3kUTEG1YA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXzQ+S9IHZajqD
 bkUHTHSy/tCFY6MXC72Yl6dRI8lEae9e4kbNXmBO4bdQptLHQ+tZNyR+EqrBFS69l0rNcNERdx1
 6/0c+0vARwcP1ZXjXF9ZTrM2eHlOqnkskHRsyxdVwVtMqMroJbHh88gJ/rtIAOzNoxJbRvnESuo
 8q6/hK/1rlTh+xOaY27IVZaAAQmf6NGFJBVYewGHZLyn7oaXXsTvRKc29M5ACtuFEH3OjqJT6W+
 +fmEA0aXSveBr/VHO3OumpvhiKdwP2SZqQ7EFPoh77nvUtKi6y34IcatgAqhGToxYskkGM//Th7
 huzcgLxE3dShXTXpvTZfHtekL7Ws3dnbOx/bNhTxvWweYj93c6C6gfX2cp2Oa5Q9Xs/iEPljN1Z
 dxyeXLoCV5q8FXv094R31V/bK4+gSSi7JbaRa/H96AbsZWnsRiALDx7HLhM8FwuX17z7G5Hu9P9
 ThRpdd5psZBayHxmIWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105949_836887_95FFEEB0 
X-CRM114-Status: GOOD (  20.43  )
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

Currently, on the SA8255P platform, protocol drivers attached via
geni_se_domain_attach() treat each OPP on the perf domain as directly
corresponding to a protocol value such as a baudrate or requested
frequency, and simply request that OPP via
geni_se_set_perf_level()/geni_se_set_perf_opp(). This does not allow
computing a source clock and divider combination for a protocol
requested frequency, unlike the Linux clock managed path which derives
this from se->clk_perf_tbl via geni_se_clk_freq_match(), and then
applies the matched source clock frequency with dev_pm_opp_set_rate().

Change this by treating the OPP table exposed on the perf domain
device as representing the actual SE HW supported source clock
frequencies, the same role clk_perf_tbl plays for the Linux clock
managed path. Populate se->clk_perf_tbl and se->num_clk_levels by
iterating over this OPP table in geni_se_domain_attach(), so that
protocol drivers on the firmware managed (SA8255P) path can also use
geni_se_clk_freq_match() to pick the closest supported source clock
frequency and calculate the required divider, and apply it with
dev_pm_opp_set_rate() the same way as it is done for the Linux clock
managed path, instead of relying on a direct frequency/baudrate-to-
perf-level mapping.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 873bfbd6b2b7..447b9cc6babf 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1155,7 +1155,8 @@ EXPORT_SYMBOL_GPL(geni_se_set_perf_opp);
  *
  * This function attaches the power domains ("power" and "perf") required
  * in the SCMI auto-VM environment to the GENI Serial Engine device. It
- * initializes se->pd_list with the attached domains.
+ * initializes se->pd_list with the attached domains, and populates
+ * se->clk_perf_tbl from the OPP table of the "perf" domain device.
  *
  * Return: 0 on success, or a negative error code on failure.
  */
@@ -1166,7 +1167,12 @@ int geni_se_domain_attach(struct geni_se *se)
 		.pd_names = (const char*[]) { "power", "perf" },
 		.num_pd_names = 2,
 	};
+	struct device *perf_dev;
+	struct dev_pm_opp *opp;
+	unsigned int level;
+	int num_opps;
 	int ret;
+	int i;
 
 	ret = devm_pm_domain_attach_list(se->dev,
 					 &pd_data, &se->pd_list);
@@ -1175,6 +1181,31 @@ int geni_se_domain_attach(struct geni_se *se)
 	else if (ret < 0)
 		return ret;
 
+	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
+
+	num_opps = dev_pm_opp_get_opp_count(perf_dev);
+	if (num_opps < 0)
+		return num_opps;
+	if (num_opps == 0)
+		return -ENODEV;
+
+	se->clk_perf_tbl = devm_kcalloc(se->dev, num_opps,
+					sizeof(*se->clk_perf_tbl),
+					GFP_KERNEL);
+	if (!se->clk_perf_tbl)
+		return -ENOMEM;
+
+	for (i = 0, level = 0; i < num_opps; i++, level++) {
+		opp = dev_pm_opp_find_level_ceil(perf_dev, &level);
+		if (IS_ERR(opp))
+			return PTR_ERR(opp);
+
+		se->clk_perf_tbl[i] = level;
+		dev_pm_opp_put(opp);
+	}
+	se->num_clk_levels = num_opps;
+	se->has_opp = true;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(geni_se_domain_attach);

-- 
2.34.1


