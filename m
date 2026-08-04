Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C00C55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 19:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=96UrCWv7PjJtStf5Ags8L3GA6XNzs2BmN7ZndIZVjpE=; b=nwFmgFMzZUe/Pq
	V/FPTtuZs2/Y4kxSpESjaPOwN1aSTI2tiwGjwpa7xRVBtNHVi2GXLvtD21wKSWMB4Gs2+PfvLlnxX
	3yl81LtoSu7xvqo8ybIUaqIiGQB2MYMedHn91Atu+gpGdnbITYehjKWV7ZdqGFlcnxkCOPXQfF7p9
	saWdHstYNGCDNRh5cz939cVdl4i6r67/gSW+jTOxzwd7JmgpvZ4+c+2V8h/CkhE0o1reIW5VmdlMF
	hjL2AO8cQyAWtg5RW1n54VyXYWicgH8Ux3vyrHdhLOi+n1zmGftcDscRbaAqB7VKPPeejbk3FM2LW
	S7ng6D6J0LJ6hbhTl2Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLH5-00000002jLv-248A;
	Tue, 04 Aug 2026 19:58:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLH2-00000002jLK-3lGx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 19:58:06 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674JlTIo434371
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 19:58:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=96UrCWv7PjJtStf5Ags8L3
	GA6XNzs2BmN7ZndIZVjpE=; b=bLQTv8LK0U3o0+vtg49Yy43Aaitj8WpZXbpKUL
	dsEbRKqPO4kSvyTxeuIB8UJWqgSJlS9/R04s/Kxz3TtEUUYFasJShBiOCNyjhbiB
	BdUEmMkX122DE4y3/lFhEGDKNuEIgSAhZ/V74/0ZyU6mZQH9c5vp5b1ANEYdYvhS
	8lVv4JtClf+wpObhijZon2Qh6wvCGTHA6QMZGyV6wx3KW6YChBrNIHsaf5/JLZeS
	5+zmxWJ3URA5P3+BxdhFltUpAa2BjVJF5405+HXLLNUOQxi7iG6doTf+APwwarPs
	24Gi15VdYf/D0faOy27/qx04NnNMZUigGmKK2IeYHbhs2gUQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fum568uf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 19:58:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so106795a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 12:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785873482; x=1786478282; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=96UrCWv7PjJtStf5Ags8L3GA6XNzs2BmN7ZndIZVjpE=;
        b=ao1SJtvL4ixAdRbtcXkbIk/N6kOrt49psu2UYaAPhxE/9+B/l9J1oK5p9iFXY5kiof
         3aMlq8x1FQ0F9vCf4EidlBDESEvHvFeqpjVkwPqV8C0lraKKRx1+TBlSEUO/cz4dTYxy
         n1QDgXPfXqgPcc9CLWc9Gjq87KEB5YP5X9Xu5aXI2i5CoRAgTxemlOveJ1CgTA9kfKpV
         hUW0fwWfzzJhZ3baHj9NL9lSHRZt7U2noB19eabEnUlpp0o4Rqzd4R34M4IwdpyNANlb
         GMy+SKkBkyA5S6DxMsfr6iqytXURaShF2u2Z/10oC7AUtcIBUQt0vFr4bntGXOIhA6BC
         0LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785873482; x=1786478282;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=96UrCWv7PjJtStf5Ags8L3GA6XNzs2BmN7ZndIZVjpE=;
        b=QjZExl00ck65KsRqqbcZd4NKC858reuzuqj9Z7dPpTpnmrwHWsVefiWyNjMQ5TTVEQ
         /6gF4/avc1Gz0dATeYUEGEfE0Ouxu+x78qv0/G+b0QCyqIyzbT/NuOE3wH5w1+Bwqls3
         y03RgYP4I9D35UueZGzGkCsGpdMABcGihsTRw6Soe9IKCtf0a7fILUnCCAPPHRzer2kq
         J0wLecYuqK9zVHxowgUfAbKpUIyMGmAFjkCsvrMKzYWBY0iwj7vlc2TN5AJZN2NS/AMK
         GDWrtRPkOdFk6wfjooSo3aKT3yF2U3yimklb3+6C4LdPsTEGz7fQCvg8oay9UmgkDS0i
         vtYw==
X-Forwarded-Encrypted: i=1; AHgh+RpsW4kZ+gxFe+NRJxEzhMODoPEKpD70if1oRUgBA8EJNJyXJ4+4MnD+3B04yKL13CPM1sBeTHnGRVg6EJ2ZkQJF@lists.infradead.org
X-Gm-Message-State: AOJu0YwOeWk9HEltRXyw9kDYAZMe/yUv/4S82wKFYIoZc2wT9XnX+8lM
	eBDFUoDqzVyq72ezMPgQpIpAvA4Kpi33exmmkf960+rwwBIrvEoqC9r+o01cjrDdL3+LQ+wBEAN
	BDnnW8/raWjXy/NXd43c9FRgsr4bMHPMxptzxOK7JBJOwod4HkPKiFkCytIg/+Y/IUVRijmruzQ
	fjXg==
X-Gm-Gg: AR+sD10Q4/ufW8s7oP3M2WkWP//P5SnfALKHFmkT9oCi/4WU2QntPn1vrsNeh36D9u4
	E5xHqPnqqAt8UDjjo506KIDGTEk6SR18ZREmR/7QFK+JJX8gclbzkk/ZP7blZ3ulidYKFBd0+34
	dmSKyF+D2kkvL1hiRQTH5/ExIM/9REeknCs0L/fNN9F9wxd8sdpyB9D7uSzmjXjULfHqhArIyKq
	UtegNEYnYH6cC6b/KojsTLi4XHPEveTs3pjvvNi26SBeUEPr8YCRL6NYzneG7FVytBNMChCA0Mx
	GsT9ApxYXDhiYFWVM5L100cNyRSx2YufE8BKYvSZlxZhLHd1RAfCw+VKAYDH+kBU6Xsd9k5M+/o
	4asfyYKoc0WFNOpzXa/xj84Als48iAj6Nlg==
X-Received: by 2002:a05:6a21:998c:b0:3c3:a20f:f720 with SMTP id adf61e73a8af0-3cb85fac059mr1216101637.36.1785873481813;
        Tue, 04 Aug 2026 12:58:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:998c:b0:3c3:a20f:f720 with SMTP id adf61e73a8af0-3cb85fac059mr1216051637.36.1785873481275;
        Tue, 04 Aug 2026 12:58:01 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a68fdsm12316636eec.25.2026.08.04.12.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:58:00 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH 0/7] soc: qcom: geni: Derive SE clock configuration from
 OPP table on SA8255P
Date: Wed, 05 Aug 2026 01:27:38 +0530
Message-Id: <20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADNEcmoC/yXNWwrCMBCF4a2UeTYQRyzqVkSGXCYaTZOQxCKU7
 t1oHz84nH+BysVzhcuwQOHZV59ix343gHmoeGfhbTegxFGe5FHYvp+ZTHhR5uKo6UCupGmTTZP
 ykVLO1JQOLNDhWdkDIo4K+mku7PznH7zeNte3frJpvwqs6xemGz+TkgAAAA==
X-Change-ID: 20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-2f29ad32226a
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785873474; l=3194;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=30qgLQKKCow2Vd7Rsipof0YfdQ8riHpCd1YMdGG0SCQ=;
 b=VyYJLSlovV+NAczF/pwSRV3VrbTS83eTlSfC8k2adZOrG/17by3IfQqdTpqt/2kbe0n9Iwwe6
 mwvMtxG43tmAquy+6z8OK9XeeZ4Qotp28tq/sM6GnkRHGkvbBnk30Wp
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfXyy26nzyGd7Ka
 V5jPFAEIuhQ4lKtnO3SkHU1wag7d7kN7bVLhDXygniHsrqoPJwR5C+2NugmWqYJTnTF9jGiWYlN
 yd1eDpvX/2hBx47uJ/XbXrodI3jE/e/PzPjIKWQJpp6Wv7AJZqjfh/KneYX2pryEQ74NK6obXsp
 cxUJbdIjEEEMYx0wnKIxylp4Hmlwrh2zRZME6/LK4W+vRHStgN+QuX0007WBj2K9AjD72n0g/l8
 84AABqrampg2BrCCp7/xzza2GtVAe1TR9bLzX1+UDUp+2gRWJG83s77hzGXCWcvaZYH/E+whuwH
 0RINrrJGZHHgPwK05rYdgPz8whal6uKr8gatD3x+iI8xltqVwMfQQWsKxPURS53pIdMQ7APalSH
 0nC21/9wbdf5WsDhQfpKlwj4gso0X0TCUDFGTpa2nlnLo9JMZjRm7A10l1/eUWgjR/m2P2Et9lB
 bMhgFj5AahPlrRwSKBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDE2MSBTYWx0ZWRfXxd9MsZTr3FOt
 VmPB2AD5lysCJohXgvxneZEeL6ALbPr5MlYhftvbP/TzoAtB3qpj5kty/JFltTf2dWaQFzk1cSe
 Xq9M0ocjU0JL/Ge8tnw9dawENQMW+fc=
X-Proofpoint-GUID: aHqQipc3d-aBlhImlGoU_PS6pdporCTJ
X-Proofpoint-ORIG-GUID: aHqQipc3d-aBlhImlGoU_PS6pdporCTJ
X-Authority-Analysis: v=2.4 cv=GL441ONK c=1 sm=1 tr=0 ts=6a72444a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sUha4Zbooll43uZDtmUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_05,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_125805_153718_564A127A 
X-CRM114-Status: GOOD (  13.57  )
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

On firmware-managed platforms such as SA8255P, there is no Linux clock
handler available to determine the appropriate SE source clock, source
clock index, and divider values for a requested protocol frequency.
However, these parameters are required when programming GSI TREs, where
the hardware expects an explicit clock source selection and divider
configuration for the serial engine.

In contrast, platforms using Linux-managed clocks derive these
parameters through geni_se_clk_freq_match() using the source clock
information stored in clk_perf_tbl. Since the firmware-managed path
lacks equivalent clock information, protocol drivers cannot reuse the
existing frequency matching logic and instead rely on a direct mapping
between protocol-requested frequencies and performance levels. This
creates a separate clock configuration flow and prevents
firmware-managed platforms from deriving the actual SE clock parameters
required for GSI TRE programming.

To address this limitation, the performance-domain OPP table is treated
as the representation of SE-supported source clock frequencies. During
geni_se_domain_attach(), the OPP entries are used to populate
clk_perf_tbl and related clock performance data, allowing
firmware-managed platforms to leverage the same clock frequency matching
infrastructure used by Linux-managed platforms.

With this change, protocol drivers can use geni_se_clk_freq_match() to
select the closest supported source clock frequency for a requested
protocol rate, derive the corresponding source clock index and divider
values required for GSI TRE programming, and apply the matched clock
through the OPP framework. This removes the dependency on direct
protocol-frequency-to-performance-level mappings and provides a common
clock selection and configuration mechanism across both firmware-managed
and Linux-managed GENI deployments.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
Praveen Talari (7):
      pmdomain: arm: Fix -EINVAL from scmi_pd_set_perf_state() on state 0
      soc: qcom: geni-se: Populate clk_perf_tbl with SE source clock frequencies from perf OPP table
      soc: qcom: geni-se: Add helper to set SE clock rate via OPP
      serial: qcom-geni: Use geni_se_set_rate() for source clock configuration
      spi: qcom-geni: Use geni_se_set_rate() for setting source clock frequency
      i2c: qcom-geni: Use common GENI resource initialization helper
      i2c: qcom-geni: Use geni_se_set_rate() for setting source clock frequency

 drivers/i2c/busses/i2c-qcom-geni.c      | 45 +++++++++++-----------------
 drivers/pmdomain/arm/scmi_perf_domain.c |  2 +-
 drivers/soc/qcom/qcom-geni-se.c         | 53 ++++++++++++++++++++++++++++++++-
 drivers/spi/spi-geni-qcom.c             | 17 ++++-------
 drivers/tty/serial/qcom_geni_serial.c   | 19 ++++++------
 include/linux/soc/qcom/geni-se.h        |  2 ++
 6 files changed, 88 insertions(+), 50 deletions(-)
---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-2f29ad32226a

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


