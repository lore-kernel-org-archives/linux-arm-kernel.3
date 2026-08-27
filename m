Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287DAC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=; b=3JUtl8r4wP2f2CtXqythzuwB7S
	y5OscYBYUa4l8mFGwO75Z2lfKQ78nFq99BkGlzmWftZfax5qoOmP4oMIMz8aKCgpLkU5Ks6WdDqCv
	QUVNHYqBG+AVuJA1zn+emZJ0meLSTmPGyukY6lrqcTzaaruLf61WFoC+K/vxLSupcVBIfFy/3isNK
	ZB/2KibFTtaC1ZJdCIOa9m4hXnzO+S3pdVY1oyeL09f1z/OiSDDcU8abPBoW++vfhgz2XGrO6AFlp
	o1pJUylXWyQYqiiNr+MwEXTflWdlbmRpfYlmhyfhze6yZF54Uo9D/Xm0Ycq9XOWDE0BIlg27nMx0/
	aalwjeTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd7q-00000004MZz-2NSw;
	Thu, 27 Aug 2026 16:38:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd7o-00000004MYz-0P7D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:38:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbfPE3829411
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=; b=eRQcJWgyQYtV2xZI
	yHR4BID99i5hoQ8obVhpLKRNZ9dqwYwyFIT+sYdFhKvut/L/mrFeU6BAuAs6w6TG
	ujzo6Al9eBiewii2QWAEu13fAvoQPikO+7B34R4ZuBySNRVbeDbV5Os7/Ok9wzg+
	orzpoizxIJ0XohxllZZdWQ5gUENp5knYfKE8hyi41PsBLUtjdVsPG+U6EIl/vgAw
	11JylrytQlKR9AiuHbYESXdKW4E16yShf/8IRoRLtA4bDFsKT1PZ6kO1Z05qMf66
	yBqRkMCgKVJuNs9xDZMfbv4XbFOgbDuvSOLglCwPScmOsYgK7zwnNF7E3E7m8eC2
	/nKwFA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4game7s94e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:38:47 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b19ce23e5cso147840b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848727; x=1788453527; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=;
        b=MlUSFEnfFPgxpI9ximtOdIVD8h6+UKC3LdnbLQSQxkpjhkqeykyepVquo6RJlRXNci
         9+Nt9eIzPcbEuHj0rkWcpjlDzg7NpTgMnz6dqcBWsAFOKMDq3GFm5DRGrYvFtjSiaU+Y
         Rd5CDwkQUNMClQ59GToNRRZdS04QVdOZJDj7UOrugYsZ7zZuVWrcTYgcAAOS42DJBNQ2
         mQcxba2EuF/YPoysQPoD8SuG06NTiaVAmg4K0md5bkrrURCPL6oGaaqriychgBzQ7y03
         fUG8cyGkh9xOnUaNujo4kAQEpxVrC1rsE7bG95aUIiB6elRWtE0WpXAZuSCHCtqd2xP8
         gu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848727; x=1788453527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHKTpe8pp9JpvuVxGFlRJsbq12DvNmufk1YkffXJuU0=;
        b=I/S2vb/3pcOk4Aaa7dQfe18D8X7EuQh9BWnv1EZuErkPExfuGnEYf0but7YjD9w++j
         01KawhQXWCFqQ9C3wIQ8tlmzyp6AyYl4BlBwXE050MjMUvoFltVW/XawmgC4KesK9Txt
         e+GDQn4P7QoqEy9BcznEa7jXmm+j4GnVIlu59xqsPvIvFmo7Vyoy461WjEPbXndgawXw
         0VHRUlApzm3RFgjkIWwGghAo9YVb2cq1QfxRyC6KBL871eplYvfnV8qG/oj3Yjs6DXvW
         Pc5iVJsOTk1IMvgQATjKAJcnDFHmE9GP9pRnwPcMWRfPtLJ5kjHmUwjY8+3FjtMh/uup
         K0gg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6NVS60FAzXHnniO20GM7/X4vhXcra3vI6xOInHrdyfGB0nNIwsjCq6qvchAQb+7jm2yeVusRIrCdiAsaZe2UI@lists.infradead.org
X-Gm-Message-State: AFuF++kZpj2ulL+K7rm8lAqkuQc4zqMRAbK8aaJV53TJo0iVSyRhgXz4
	9NpZI9Kp+gkn30fFErFoOmoIyS/qZvVYo4bt4hBS7cELTAQZXZhhni1BWZQa656WmcWNUmcDk5G
	zIMWxwEcnRaAMhCHLNSRe6VrNcf1wdk4xuzz0Kd1VOGJx59Y+iVZ3gQfGxhGFzn/crdt3+F/xJ8
	DsOg==
X-Gm-Gg: AR+sD13QyjjrJZeHOJVwxUOwSbYmaQwk8Mkdelnp9isvhH/a8/+0LVC2j/5vnWSAKKb
	Za5KT209HRlW/t1MghS0hB7MTvcGqEinWjBs0whZa4YfCXGQW1nOrBW9ie8ul3zSg4zxW1O+ohN
	oL0jVYsTwISCXBtCC7/p+nRFvgazVbH0qoAlaEn/PwM/Qn2mgGJrjND31JHxyaG1tYcB2KgRkmp
	RBpxbos74H14FFiABgqm+OBHCMndgQs4Xbk8m8KzVU2rLa0NJhLyqZ0dGJBTanldS5ecd3D/+7b
	A1M6QymNqity+y6tiTqpfIKtRu8Um2PDEeWqttfN3U65xV7Hr6c0Exl1aVPEYHmmH2qUJTRTMWY
	W8Tu+pskgRBxtN2ypy0tYO3bE7RFssWE4IXWdIYz92K0PHVQyCkAgoXEnNwDFw6d3Uf2hfm3WUb
	J1vglCPvR5RSVBRhZYkQ2MG4I=
X-Received: by 2002:a05:6820:2917:b0:6b1:afca:5c7a with SMTP id 006d021491bc7-6b1afca5cf0mr9495098eaf.28.1787848726607;
        Thu, 27 Aug 2026 09:38:46 -0700 (PDT)
X-Received: by 2002:a05:6820:2917:b0:6b1:afca:5c7a with SMTP id 006d021491bc7-6b1afca5cf0mr9495017eaf.28.1787848726154;
        Thu, 27 Aug 2026 09:38:46 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:38:45 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:04 +0530
Subject: [PATCH v4 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-3-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=1801;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=k/DT6AgKWqS6ku+QAjOs6ZqZtSg8uMTVP2+zB+uhR9k=;
 b=WcRc3XN0592xfhq/gEJAYqLJiKdvU41z4BnWHFvcpibh3Ovwl88G3nYrLj5UB4VBR25kKg0K4
 /fCTuWsK1QFDOsWOQSOb4Z8mLT5MmzKqrkUZC8OayHdKlLMwXecetSc
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX69aNeU8MfFJf
 xT8ZuqABu4p+N8lDVWqBHALVxdQS+vjP8Tp5tXIVLx3+KRhgS/uEEwT8YAmZTGf13Bt/kLp2cYG
 W6R+F6qi73gpI/CR/uCgiScHQ1a4AQPAeBfxt4bYPPEh5f0KpykllSHuzhJmsNJODab832yoPXN
 FMT1TyyYMsbuS1ORLhERu1bs7L8dkmnEQmlZ0yKDTiJCPhDN8kw6ZIFQ7emqfOIJupVR7pQzlVr
 eA6ZEMBkeE+okigIyvsP5IkoaGtjL5Qp80pkUxUOdeVAajgsTKIwSixUiywolD/GyBWKXg82uQd
 SlK3NScdtEBk7NwAkZWgS2fDKkRKbuhWypBhDhjG/E7AV/NisF+s9aIC16NF8Gw5xSlp+SFlT70
 zgYTg6xOCI0efST1qnBD4QLo6jDNQiePcfXKFUIrAv2fIYCO5UJRULJm1M7SnGBHq764ZVzRzuE
 CEGbiAtSaIbGykVRk0A==
X-Proofpoint-GUID: ZXywNN3RE3CAU0TujZ3kSkSrKOiXn3MJ
X-Authority-Analysis: v=2.4 cv=Yrc/gYYX c=1 sm=1 tr=0 ts=6a906817 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1FmER_HI0FvT1hCPThAA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: ZXywNN3RE3CAU0TujZ3kSkSrKOiXn3MJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX9XSOYc+/44dL
 xqyIa2Znzpoie9heF28ksoUKPnhK+cb91o+iRDVAgW/V7U2rxuhxx3m0OemYebgi0o4apBMpVtP
 n3rWR02Wl9x6vN3KEi60AADu7XMGRKg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_093848_150435_5C83C9AB 
X-CRM114-Status: GOOD (  14.26  )
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

Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
exposes CX, MX and MXC domains (including always-on variants).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 90743275942d..725ce802f683 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -681,6 +681,21 @@ static const struct rpmhpd_desc kaanapali_desc = {
 	.num_pds = ARRAY_SIZE(kaanapali_rpmhpds),
 };
 
+/* Kuno RPMH power domains */
+static struct rpmhpd *kuno_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+};
+
+static const struct rpmhpd_desc kuno_desc = {
+	.rpmhpds = kuno_rpmhpds,
+	.num_pds = ARRAY_SIZE(kuno_rpmhpds),
+};
+
 /* Hawi RPMH powerdomains */
 static struct rpmhpd *hawi_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -885,6 +900,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
+	{ .compatible = "qcom,kuno-rpmhpd", .data = &kuno_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,nord-rpmhpd", .data = &nord_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0


