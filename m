Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D130CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fn80m7lvIkTjz807COGpVE82JK0kaqF+rlFlpuCly0s=; b=g2vgxBdjb4gdnJ
	i8AzlGo757qyiqhiaQp+TAYKLCRxvH3LJJBDTYkTkRGD8LrbLjt+ENq+amzpY4iY177+1j7GBs0nU
	4DQqEFaVgD4epDR5MdMKMZYO3TSKbwlQWj5hqKKFHe3cGMtGBU+HUO6Kv4fR35cIszyfF/UOkrAMf
	CedgWhLCIdhgHsOCyX20u7o5FyWr+NBF58YM5HNKV9KDqm3RxvReWbxUDBURfr3CyCFeFsRnDJrrG
	6RATWEoOT/skmF/ETYRFavZQKyRKXxq6U/PewE1mLd4ybbVBBM5N5Xea9ShZi+XI7236U4xGHAi7M
	w1uEPzOt9Wu86k3JkuyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL2j-00000000Bor-1wpp;
	Thu, 15 Oct 2026 12:58:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL2e-00000000BnD-0ZOv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:58:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jMHb4077500
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fn80m7lvIkTjz807COGpVE
	82JK0kaqF+rlFlpuCly0s=; b=pKljQCPe4m8ZDljQiurPI5am68GgBOMrgcdWYY
	7qp0lbfjVuJmJiR1wFrlmBprCAZ1IYBJZajlZcYLnoWXBc/QxDMGKGMYBXRbScml
	YyQrb7HyJgAxVpdBxrnVOa9ps7CAU48f+gkbPIqjUcrPblsoo0GlS/ZrHdK21Etq
	mg92OeS3LSxAP1kFuVgTkzIDFPcEA9YJ1JEKMQfduWfeQT4teghicjS47L60aesO
	c5NluH+rj8SiUjVw8Db7ENRUcm0D00dLSqoP07fmmyajp6vAlvOUVNp6/OloNHBf
	TkO36L8XLx6dT85GTYQCOJMplll2/gTDwrARXjqOX/JFY9RQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc0snt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:58:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e8e16d22d8so30802935ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 05:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069119; x=1792673919; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fn80m7lvIkTjz807COGpVE82JK0kaqF+rlFlpuCly0s=;
        b=B0Px6YX7l/lRBftfnlXkN3nsofoQjsW0GxaRNqO6Ip/FtPDv7KTdcNmv6CueM4CY+4
         V7hHxvKdmf2N1DGlO795h8uMasy6RDJ8eSrl7lfmwnA/uo0rXLFirpoezCCBYyVIMjxU
         emxjeU2DUDjZ63P9To+2kp813ZJUvBCuHUBDkKizvIZcmo1Os2nCw1qgyTnWyqYj6wYA
         Hf0inf+fMiAk6TC0lZ2loMhiaaZCqzvmTeSxA1Tgc6cecgI8QTYi7r1TmLNgTRe5H2do
         cmaeV9IAXM+likWrAZeKMTaBwvS6rrRRCvpKCyelRuDfJqv1vp+t5srV40u4d/Ymsyv6
         HHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069119; x=1792673919;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fn80m7lvIkTjz807COGpVE82JK0kaqF+rlFlpuCly0s=;
        b=Vo8TJuqTTSiLfnJj2NA1wT5KiQugUsESu9AmjOICQzEWpBJsJJJSVT1AxpUDr1hrlx
         W5tgrxPgJEBcHnoJnDMnMnXJxrojhEoTv/QdlX9A95t3KwNegUOlx/nImRpLUHxJrjmP
         yYgIUMHdJpHzgYH4Xtz19IvzFYxhl8WeIHU81LOP/wGilS934DQ38CgX0Nyno25LVOH/
         rMMMRaKVzrXn/bTTZ8lxSA7/vW/4EU4K30ZV3+lwNMErbLCH9rWOMH9b0+E7kc+2Ygo2
         eru1fcrR8RTnO4BtBHAArOc8JrP25fsVwrn96TM5GyvtKCWB8RDqdYjUtLAmH9sAsPQt
         UZ8g==
X-Forwarded-Encrypted: i=1; AKwUvBxi283xolmSJtTdyfsJbKP6UQa2r1spPeO5aaAPYHxlSJF3i9Uexwdr7WgybShkbyc6qJqijaXYPy/S6v5JOou4@lists.infradead.org
X-Gm-Message-State: AFq9FYKabOy5cxB4P172rS9QWDqg3/yVf+W1W2FcG4IzejfS7MEraV+l
	T3Px1GmToOSDmcsphSkPwiALzyp1ndM3yKEqU2wbkzkvdrJkHcAtyIzmrqyfs8n2TJvZ4B6EoA4
	v6m5/me3LKF0uIVcLFPacgecQIYHECwvva8w0toD7MC5yvoIHXUKwEXvAQVlD4kdXpME5ywZgam
	kOUA==
X-Gm-Gg: AYBFou3l4loiYDoDJ1UO8xaV9pdFAeyefdBvax0H9Ga23fmbNQz0JsbgftNijAqCMcy
	6jF0rLh9N2dFWa3y2eKU3is58V+DOdHUI545TjPEXpDzs6BYQNSCo8spwTL4FjkNdeBVkojbBEo
	NmyPgBNg0IYi6MP2L6Vk29MN9IiiSht8OlJuGHTHwDS2x8gGAU4LxT8Vba2GwHEf9oELe+rp6M+
	Xwh2++H9/Me1D0qB4HzU90a1CDPUozM6KhhQj3oQinKjdE5vJfU4tGsJDAC0sV1pSDdb3TsRt8m
	1wrpniok/mFMogbmdU7SsE6/i5+J3zrI4jlv9NN6EOLKdPeBUwnxWPKc5BCs/U6JhIpu5zqvJ9Z
	oivYBMiDsB5ck0LUuPwn9gijsKhvROHtOwQ==
X-Received: by 2002:a17:902:d50a:b0:2e3:1bb4:610d with SMTP id d9443c01a7336-2e842f31562mr166589985ad.50.1792069118590;
        Thu, 15 Oct 2026 05:58:38 -0700 (PDT)
X-Received: by 2002:a17:902:d50a:b0:2e3:1bb4:610d with SMTP id d9443c01a7336-2e842f31562mr166588895ad.50.1792069116492;
        Thu, 15 Oct 2026 05:58:36 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:58:35 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v3 0/8] soc: qcom: geni: Derive SE clock configuration from
 OPP table on SA8255P
Date: Thu, 15 Oct 2026 18:28:20 +0530
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOzN0GoC/52OzQ6CMBAGX4X0bE27RBBPvocxTX8WqQLFFhqN4
 d0tevHgRS+bTDLZ+R4koLcYyC57EI/RBuv6BPkqI7qR/QmpNYkJMCjYlm2oSX5EoduLGNDXYlS
 tqL3r3mRcJ20v3DCIUaoWKdRQSZMDQCFJejp4rO3tFTwc3xwmdUY9LpXFaGwYnb+/FkW+eH/HI
 6eMFpyXXCqujca9C2F9nWSrXdet0yHLhggfFSh/rkCqsIoXVWkUKgZfKvM8PwHOdkKGawEAAA=
 =
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=4235;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=v70FRW5iiRhX/4+aCXUZxMXenF3esiNtKu86as7Ptlk=;
 b=u1m3iW5BCkVT1gNC6NXOBIobcvi6p6ZecmCB7PJ6QxVqlmRw8ffyqb9rCaDH04jFYYTlQZXWh
 YSWnLJ0Bgu1BjkBTlL/XVn6X+JoGHcmU9dOvlGgu3Qc/pr8Uza3vAAY
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0cdff cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=2LTROXezBIF7KgQVBLEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX15du56l8hEEf
 /+G78VPW3nfvyzvY7lhhiHUA102ihcqaIC5eF8+qpUnc/APwG9V6atUPGJoikIjDGmHFfjU56im
 /yl03QhavtG7pY+0oaatCOJT+Y1HgzU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfXz3Y61D5Kg7Tn
 /N7KOlnW+KPUJxIhXX8F9FGZ8IUPL2Qy/pqX4CG4/Z3sLFLzJ/4NHi9Va8ZiTxfGnoGxD1C9lKA
 XFndRe9Z022OHUNKAaSP7GbEZJjAEh8NK5kh++pXCONBrrLhiJBMZMwjLHtLiI/JOOm29JQv3bS
 w1Awjq/qdH6duk2H8DnTpom5e/aNnrYhFIaJmXhmCrPsaceo3siFGjVoFY9lYolCus7D9SIQb0p
 NO/hvoxdt/eMooF7AibB3acWxSRvd7U0Z2SsCFvjidqRKyBTkLIBYmJwxquI7+FDFnRyov6Xyjr
 S/b1kqw7NMjNfq75PR4jeQI0j28jQctbjiYLYZh6kxN7Ye7wfRls9vDAs5GxySQDZZpmQUn0WAO
 08JGACyUbtNd+UK5v8jZOWHrU8pZnjI9PapAW1fuAjHQBpxbszDjDP260y2KXZUQtZgj7dlnxAK
 S1FL5r8eWICL19ot71w==
X-Proofpoint-ORIG-GUID: Vkjo8bB9fWoLe53U45xHUZzvaRk5cNID
X-Proofpoint-GUID: Vkjo8bB9fWoLe53U45xHUZzvaRk5cNID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_055840_408200_8CE02981 
X-CRM114-Status: GOOD (  15.17  )
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
Changes in v3:
- Added a return check for set_rate.
- Remove redundant source-frequency fields from clock tables.
- Store the validated frequency in gi2c->src_freq.
- Use it for OPP configuration and runtime resume.
- Preserve exact source-frequency validation.
- Simplify OPP level iteration in geni_se_domain_attach().
- Keep level initialisation outside the loop.
- Increment level explicitly after processing each OPP.
- Link to v2: https://patch.msgid.link/20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com

Changes in v2:
- Add new patch to remove OPP rate reset from resource deactivation
- Add new patch to vote source frequency via OPP for I2C
- Compress the SPI, I2C and serial commit messages per review feedback
- Drop a stray blank line before trace_geni_i2c_bus_setup() in the
  I2C resource-initialization helper commit.
- Link to v1: https://patch.msgid.link/20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com

---
Praveen Talari (8):
      soc: qcom: geni-se: Populate clk_perf_tbl with SE source clock frequencies from perf OPP table
      soc: qcom: geni-se: Add helper to set SE clock rate via OPP
      soc: qcom: geni-se: Remove OPP rate reset from resource deactivation
      serial: qcom-geni: Use geni_se_set_rate() for source clock configuration
      spi: qcom-geni: Use geni_se_set_rate() for setting source clock frequency
      i2c: qcom-geni: Vote for SE clock rate using OPP
      i2c: qcom-geni: Use common GENI resource initialization helper
      i2c: qcom-geni: Use geni_se_set_rate() for setting source clock frequency

 drivers/i2c/busses/i2c-qcom-geni.c    | 58 ++++++++++++++++----------------
 drivers/soc/qcom/qcom-geni-se.c       | 63 +++++++++++++++++++++++++++++++----
 drivers/spi/spi-geni-qcom.c           | 24 ++++++-------
 drivers/tty/serial/qcom_geni_serial.c | 26 ++++++++-------
 include/linux/soc/qcom/geni-se.h      |  2 ++
 5 files changed, 113 insertions(+), 60 deletions(-)
---
base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
change-id: 20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-2f29ad32226a

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


