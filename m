Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C099C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f99q1/EfVd9fZessbQ28VPg/h51qq2Bt/mxBgayLr8A=; b=AiZdtcxEhSb488
	Kce74mnQQcPi1Ao188H3fujFHhw9mhhN00e/r/ESSMeyzpTbwdsxtU1grsfb6pqIkArLF6tTWZI1b
	1vuRAIG2qPK5vSo6JF7fKzkUCIaRzWpV7RqwkYiGM3uwp86C19eNg3mXXo8hzzCXg1PVA6vlUr1E6
	3V+MQpzNLxvTRkKSLDrue3CSh9BWooUDN57TpH8jMcsNuFPNRW0KH5teY239gFpOEvR5y2ygDf1Jo
	+67Lk+PiZfEtW5sEI0guA3pAbdChNdRDoC3fX+wjCsh7UdYuC2ghJdFrPCtN6La4Op5f0/LEbIrPi
	a/lyktfxWb+objkCo4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeO6-00000004XRC-41PX;
	Thu, 27 Aug 2026 17:59:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeO0-00000004XNx-01DP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:59:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXcWa614547
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f99q1/EfVd9fZessbQ28VP
	g/h51qq2Bt/mxBgayLr8A=; b=R4PeHk11fPI39iwjJqNkBiksbYGUUehDNgjv8o
	BDBOo1rltBHOrw3zgejyv92Qde9iRd3jNV3NPm4av3042gme10EU0qv9dOOUd06y
	G3cLTPl0AU3LPkx3xAr8XTnsqlKXJQ59nsMLwCSYgkcXJT0YuzdWeb8SHN6Wr8Nq
	4Xc7ys9A3/HKolSS5AsgLTP2Uo2ra6xUarQIRUGVDuImGksR9LLedvAa2psO4E6n
	ScV0Z8hDqc5lJSvSIwqm7XlGrYZiQrIm159SjCUzNzCK8rXK/i9B7dbyK3+K3DQL
	HeKtqaYX+mqqOS8SGOXl+ITJYSU750U5ukWsLmEiNTh8jDNQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ganr69b31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:59:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so366059a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853574; x=1788458374; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f99q1/EfVd9fZessbQ28VPg/h51qq2Bt/mxBgayLr8A=;
        b=OBR7RzAz0BzK/R+DIJSs3w0aEgo38GBD7PDsh6tYDLTuFzsvZBUFK89bNDkmTO3Nx/
         XE8iP6wZN8+bvnFHq+Z7nuoCnjdptLMexX74z4QqblasR8OcIarpN9qkeOgI/kRlWeSj
         vujasHEp/MDbFWJQfwN4+DnG3pex1C1AuZLvosBi9mGk13k5UJmYb01kldhce8SJEsxN
         g+gVmceNk1iTnq+G3bs15VQWb18N0CzvC9IKWmphu4i1xWZF+t1fvMEJrOwr/wx/CDyM
         AkFgAX7KgzeWltJP8bF1ez5A1mcEyJV1mVNmmW01K6A+BSvPKmf5fInNX7YVA9VLSzFX
         7KTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853574; x=1788458374;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f99q1/EfVd9fZessbQ28VPg/h51qq2Bt/mxBgayLr8A=;
        b=oLSKO6Rd78yILNvbjFfgowadTPdHT8GP+WCwT1cdnN8y6Wwk0EcY/xsrc1q62lHAWW
         kQ8Zk8Oqbu1M1G0rX32BYaTCDJAOsazXGAKuC7GpJRxjqeef6uoHYVwRvdG/akEAXv9B
         LYOjydBrYF0WMKbBEG84BqBNpOyHLVRTikna3Pz4nQ324tB0fF/Nwc37Wn8s1mr11buU
         4EhBrB5YcEwFnodUSJEAZ92XXlIOnuNSTKvaEqZOgU8sBMBhGfJ+B5RO10xn5MJR2FGL
         Jm0wxmfs4Aw41NytQ/SMJQzjqysLHKGhDDNLnOH7zq8bIJcJc6njlssC9Qavl1JpMFAo
         As+g==
X-Forwarded-Encrypted: i=1; AHgh+RrsP/P6KtiITJ8DIvFPi8VxD7YHyXh10j69mpF6dTnbMBeqeAow4MWiwkRCIt/OvITniOi4AoFTBMgXh+D7f8tr@lists.infradead.org
X-Gm-Message-State: AFuF++mNuihfx/Mt+UakIj5uqlSinnec7XaMhQdVRdn8jFGtSIWQTDGT
	lhwt66ryTkDqwX5NJJGpQps1GgU4IgRFFKhM9pVLG859/2K0A6/LkQkziH9gZCR5cELiLQlb+KC
	cSU9hjoxZC9V9avO158gkvzdjq1j6Aoevx3nYrhY87II9QxqRjRAQB8kaQthyyZy0Oppdsle7M2
	G8hQ==
X-Gm-Gg: AR+sD10KEOYCFi3p1cpJtRJxGfyhs00ugCiH16XUp3clW0/n//MEUDjf50PJZGIYciJ
	QlNIniFeonScGeIWdqAXKX+lJLAsyI/hnx8VaGfGS/c+BBt6UtYwrAV/iwRTHp9JkDhE0pi0POn
	JYKiKoqv4e6ATCb9pb5J2HbXUDt7GfftAg9ojR0xwsvFPd3mC7tnHpaPcWgNGMMck8SG463ziN6
	oeuGZrMrZrG6yrMRFVmjZmjDoyDGWb6PTwxwnNiYT4kZBzzOAEhkk2TXRJ+RJdp5x+e42TYPQ2X
	4TBvpXkGzfFWXRhSRs1uy/4zgeCimd5fXVOf8qm5lzjW7kZVoGywAHc8ku0ySgfn+ebe1DHYHTE
	cxytXjJFex4wAvAKcv3nGFpB8SOgCi8+qEA==
X-Received: by 2002:a17:90b:264c:b0:396:61f1:da5c with SMTP id 98e67ed59e1d1-396d0e86577mr1841396a91.4.1787853573597;
        Thu, 27 Aug 2026 10:59:33 -0700 (PDT)
X-Received: by 2002:a17:90b:264c:b0:396:61f1:da5c with SMTP id 98e67ed59e1d1-396d0e86577mr1841280a91.4.1787853572974;
        Thu, 27 Aug 2026 10:59:32 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm27437523c88.12.2026.08.27.10.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:59:32 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Subject: [PATCH v2 0/9] soc: qcom: geni: Derive SE clock configuration from
 OPP table on SA8255P
Date: Thu, 27 Aug 2026 23:29:17 +0530
Message-Id: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPV6kGoC/52OWw6CMBBFt0L6bUk7Rnx8uQ9Dmj4GqVJaWyAaw
 t4tuAN/JjnJyT0zk4TRYiKXYiYRJ5us7zPAriC6lf0dqTWZCTCo2IkdqMn+hEJ3TxEwNmJQnWi
 idz8y3knbCx+CGKTqkEIDZ2n2AFBJkkdDxMa+t+Ct/nEa1QP1sFZWo7Vp8PGzfTTx1fs7PnHKa
 MX5kUvFtdF49SmVr1F22jtX5kPqZVm+v1veqwUBAAA=
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
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853566; l=3793;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=/+YatdltfR0iMDpKsEcQ1d3BbMXEeeGwVP7+dDq4nRI=;
 b=st+LTRVfFk5svHyCZv6i7Uv6xa7ZAuHILjEGhNjK1QxXVrVdp25J74WVf8PSJSsZRimRFzrY6
 nIgViibqvaICdTBhGTLqq/Ijl8YGjlpKT/GsFZGxpHwZNTekgC/Wcdd
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXyB7I6V7FH5Vh
 zXylF8IQqmNJO8F/80YoixsEkOdCZNWRzKSWWyk5He/7aM86nAbxGmjqJygZK5mce+iZyMKj2jM
 aHSOMospe9bPG56kk4lDGmv5eoKzQ37h/26fMwgIpfqWE02S3HO4IinvwcIUsi/HhFYbJ3H2CJU
 mTscHUy9vmj5ig8+L9ZG/P68OhGb1dk9MspcwCN4bEU7yLMNN6oQo+0+EMHMDcNR/Ma/rsagDmA
 NM2eEtQyBjG609gyzcILjoHRTVJ60rV8ASzIg1go08GSDw5f3SQA83zXJ9cuqChOsfbafS9eveQ
 /Gscl8eK/zbIR+yIhn/9oxASqYxHqkJF/NwhulGwWqadohwpT6qp4aUzwTV+XvxPos0llCPtues
 ttVM8xJB78x71iMVdNmvYJqOq3TgvIS+V1PsqwXLx//swfh1c/pl2BTqAq/lDKARNU0fEJlHckN
 yt8UF+60ikmOIbvPxVA==
X-Authority-Analysis: v=2.4 cv=d5DFDxjE c=1 sm=1 tr=0 ts=6a907b06 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pe4rHqQ3xWNOjACthRQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: JMoRf0U4Tzp7GoUOvfbNpSrdScT4Id7s
X-Proofpoint-ORIG-GUID: JMoRf0U4Tzp7GoUOvfbNpSrdScT4Id7s
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX4x1XaDC+Nfol
 /xV9w70MeIiOskoPt+dc5+0OCD2fiESv8CHMdiMzCIGGgtysvNjyMDIC/DY7vUvb+XXsf1TMq4j
 Ks0ewu9EHrRTWKACWvusgm7b/fxM9RE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105936_189768_B3F1809E 
X-CRM114-Status: GOOD (  14.69  )
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
Changes in v2:
- Add new patch to remove OPP rate reset from resource deactivation
- Add new patch to vote source frequency via OPP for I2C
- Compress the SPI, I2C and serial commit messages per review feedback
- Drop a stray blank line before trace_geni_i2c_bus_setup() in the
  I2C resource-initialization helper commit.
- Link to v1: https://patch.msgid.link/20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com

---
Praveen Talari (9):
      pmdomain: arm: Fix -EINVAL from scmi_pd_set_perf_state() on state 0
      soc: qcom: geni-se: Populate clk_perf_tbl with SE source clock frequencies from perf OPP table
      soc: qcom: geni-se: Add helper to set SE clock rate via OPP
      soc: qcom: geni-se: Remove OPP rate reset from resource deactivation
      serial: qcom-geni: Use geni_se_set_rate() for source clock configuration
      spi: qcom-geni: Use geni_se_set_rate() for setting source clock frequency
      i2c: qcom-geni: Vote for SE clock rate using OPP
      i2c: qcom-geni: Use common GENI resource initialization helper
      i2c: qcom-geni: Use geni_se_set_rate() for setting source clock frequency

 drivers/i2c/busses/i2c-qcom-geni.c      | 72 +++++++++++++++++----------------
 drivers/pmdomain/arm/scmi_perf_domain.c |  2 +-
 drivers/soc/qcom/qcom-geni-se.c         | 62 +++++++++++++++++++++++++---
 drivers/spi/spi-geni-qcom.c             | 24 +++++------
 drivers/tty/serial/qcom_geni_serial.c   | 26 ++++++------
 include/linux/soc/qcom/geni-se.h        |  2 +
 6 files changed, 122 insertions(+), 66 deletions(-)
---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-2f29ad32226a

Best regards,
--  
Praveen Talari <praveen.talari@oss.qualcomm.com>


