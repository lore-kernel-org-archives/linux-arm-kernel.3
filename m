Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE30BC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vfuwHFmujlvznbArz1IOwxTplKAy4SM93AJJ89i1FI=; b=wFy4EG+Adhvq9GTy5zSi/kZrCI
	9G/7Lh3QOjkySGIM4mAMlUGHYdKZezkLSeZTdfloy4p7and+Dgq3uvWSt/gU2fXoiFy4TwwqJq/Nn
	NyNUBTCGvB+Kr2wa/r1hRiSdfSDYpsBORQ9xCze3hs3XHb6UttXffw/Auck/DJlce/aMdbjdnzwDx
	Ymh6B8qRuXAZEC92z5Kog7iDLKKo1BxeHw2c4EbjChDkeatRYQRSMkCWJMJNHNZyQSChwa7Gkfvv3
	UxnnELFjlpWlrNGxPBIHAKMA2f97PNwC8Dfx9zLkuMEAHLYbyA5Sm2I+4+qgHPKDMLxIYfBg1ncnI
	Lw3hjfyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Pqr-0000000CO6s-38f6;
	Tue, 01 Sep 2026 14:52:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Pqo-0000000CO6J-3Ok1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:52:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8dd63913701
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 14:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1vfuwHFmujlvznbArz1IOwxTplKAy4SM93AJJ89i1FI=; b=pkC/omtmbkdNhGX/
	azz1NEHTywdet0R76I0A4S4i1q0AkyhpzV+ZbYugZ6NJE7lZhpxZ7zXdo2MeZb5y
	MurBZT9c1/N1cNJUc8I1hAIwXSfAgwgDd5+L0mENzZnGgB0JxxYZpwnekCzl0fdl
	veQv70YvjRATek+eowD7FJIrNeDF3aTkW+TLWrbsmi6FHkhQDKy2jY6LaN1Z9f3B
	Lyuo5VvsBL/lXHU3QI1+5OrN1zfdsSoi5yDAmPQ3Fz9hSW1xH6D8+6V85sS2cGRD
	NrB0R7c1uer9jG5XT3aqwAgcb1Jl8ulNqw03QJbbDTt060JK+XIwso5IpIvGdRQL
	S4RmhA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu26r9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 14:52:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso6688831a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 07:52:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788274357; cv=none;
        d=google.com; s=arc-20260327;
        b=ZlubVHdPF13Z4FowyWz2896YHZVAHViv4sNUbB13EzgoLEpRfBasFJgaCXxUphTDA+
         TnAk5uvgJWr3pJvWp/TEadCGqTa6iQaqsY89rB/E1GGfohIL151J3Mmq/BQJerWCdRZ+
         SQvg+zvkCa71QXfTiCsHyJDlBnstktI4tC84ABJKWP5zIdZSCFYkUwXvFy6LyMZ1bMWJ
         LVXgoPLJbW4gcdVY0YWa/W/994dfzmS8G/dHr01VwJxjr4nGdg/Q8XZv4ngSg5kT+O32
         NxxylS9HJieOGjDiO/mL6HwUBRGz4OuxAp8fWLqGFNoZA0ObzEXp7Z48pajZi6pLuwu8
         x75Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1vfuwHFmujlvznbArz1IOwxTplKAy4SM93AJJ89i1FI=;
        fh=Xs4TO5ba6O6/Q04b2I1vTJ3ioDvtgBiAgX0PO/UaucA=;
        b=pchMLKtwAkqUTD+w89TLNzBpZ2Y8XgvAjEfVu2SJGX2qGqIXHvQ1OTjmO1rdV/wO4B
         8d4ygKpTryAnDQefWIjXrxsX2Qjkz7O67Ftk3OIVJ3nbKQ7G8kkWA5MfiSLEhmZwD0o5
         Twww4uvhNiRAAAO224N8wLPCNDfX0HLzkuAcdI0ySTxLUvrDCJlFTOgmrtJsUu6LyKql
         +FC7pV7jnzS6d1N0K5K932L6zqpzSBJQeRWIon82+8jvw68TM33NxMtNU0BuaeNZ3Bxs
         ZReKFSxVmBcu/0xNknr8CxsmAsB+q9viHI/sRLwwO9zZlnMulXq1kKxNpW0nYRuLu8EJ
         0YIQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274357; x=1788879157; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1vfuwHFmujlvznbArz1IOwxTplKAy4SM93AJJ89i1FI=;
        b=IPelXNnh8i6nvOz7VNEdvHxxH7W00s14H8lz68+8Qu3fHSgfg5DXFksB7HBPt/VYwC
         8i8htB3J/0oD8X1p8vZy5dwSbTTnJk53nAhQUhTSBY3AZLgdzCGOmM2pf9s/enP8EAf/
         1vQZqo776mP6k+GPyjIvI/MbPwn/TlIulhRhQYjdKp1D8L6TpFe8TlNju3xfIeFBECt+
         DgBqbjHaGzsIahZOTa7ansNWwFjLyZImobcsGSKPbkUu3PEAFGB+MwVbUAr9uOxnJ+PT
         DiF4wyWexBpQfhiNpWcSUGvjE8ykon36GWCyhhbnHBmiZMR9ZJjKRd5bHSumKuD0G3I+
         IjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274357; x=1788879157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vfuwHFmujlvznbArz1IOwxTplKAy4SM93AJJ89i1FI=;
        b=SqONE/ZHu4W6OKF2mH+A2qedjWaKUE0Hju0qkETMMASQ6vbyX2MjSQ00ryJrIrY7+R
         7OuSXgBeIhzAvxGok5KsYBZ7KeOmvp1hH/iEs7g24khHOD7NCGoZ7b25p0rh+uyl7ueE
         FyWG4QHc6QrA42hCYkeQYvAr2zOGP766uixQ3wrhekk7JQO/Criv8InDtHk1Ykv9fReS
         bWVl69bIdo1u+Tp6g5kkQbQE5o8l9dN+YNbjK4ft/2OXDxNj77bEygCQDbnDja6LFIWo
         4sHmqjiewsE1/gjKFYfEXn5o1vOWWqBCXMT0mlC4aAZrsf0MadIsJScjpfhLb2GTVgdZ
         5vLQ==
X-Forwarded-Encrypted: i=1; AKwUvByWuyv7jNz6B8V8lxZpXCG3w36TqHtwccGiJ4gb/IrqP6F1qiVL8lVXeyXIM1jCJNUP5D6ZckzEhItKsnCLss59@lists.infradead.org
X-Gm-Message-State: AFuF++l2Of19HkGU9vG3nkq+5XSXpVsfpa6EqKAjjmAfdqy7Lo+QYulL
	3u/wnnceUKQtltrFrV6oq3yonmlbLQkG2cbAXwr/WKoGb0olnhvdL3dAfg3HMsbvW2pyV7jJj1w
	Zmo/UCJ/Yyxg+tODYkb+Bl8ZAT6YGshEbOBI7It4FM68NdhqAzMY/eoDm+qhB//Ai6M60dyEY5L
	ChU/nAMUSRsxgAoubyB72Ha6NQeAipsupcYB0imxfUOhUPfNZbSRNJ
X-Gm-Gg: AYBFou2kkKW5PwwilUvj6Jl093aOGXRr6P/3GICJXculAOqTlSO9N0Y9kFQdyxmntij
	/X7hfo3TqkxsWU/9m7RaSyEu8vqOFWJFXYMkKVmRESt/EH8Y493cGHvAK4319Gw7Iadi1hWHRYL
	iB5sbecDumsTkETRiQRoxy87U51pe1A2HdK6jhOQAad7WZb8qY+q69FrHLDQ==
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-396d0e5bbc0mr57212358a91.2.1788274356777;
        Tue, 01 Sep 2026 07:52:36 -0700 (PDT)
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id
 98e67ed59e1d1-396d0e5bbc0mr57212254a91.2.1788274356218; Tue, 01 Sep 2026
 07:52:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:52:25 +0200
X-Gm-Features: AcwNN1UC04dwwquCOb-ua7jDN7d85m-55EBER85AH0RMtxh0hIHGSX1Ky0hJw5M
Message-ID: <CAPx+jO9fcvBsxe9yx9oK=0EXmpNwub5ba0a-TGk1WRFaRGsqpA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] soc: qcom: geni: Derive SE clock configuration
 from OPP table on SA8255P
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMiBTYWx0ZWRfX2XC3bzhrAFL5
 DeVErfvXvypFcsskrO80IF9lNribebAFeGJPQT5LfYVnE2V201b/NGpme7aaQwY2XRPbEgDdMdC
 wbazZwiETOP/9XjEmMhXZbJuMwqGD39px0QulEiiED+BI78CKNGU2FNFtStnFKZ4mnacdW8gsUm
 +fDWXM1ojcMXs1x3uXzH0CCXZS1fjGwwV4sg5o1bORKDWvvOfXPSVjcbs3CIMRZXT0/ovQYUals
 hdUU0hvp3E8/WZZKqImcHHw9xHFmGpdallBBewq6iKaMgBEq50yIwsPu62SPPTGL4/vmAprXQf5
 HoP0eQQTeqvGaXY7pOy4cQL5Nm/U4WXp+R0arAYG3/pVTpsacELXbG8nlz+zx2+7uKCAfEoL2LH
 ILVmmSddI2rA6Ip3uMnXIK4+m2iQFliShYfazz/pnDsRx2Uv5g0hHfHCp5KfsziatefJWRa5+Bs
 1wXFaeiLR37+rydmdVg==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96e6b5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=jU46xtICLe5dyPpNWKMA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMiBTYWx0ZWRfX51XPTDoynZnM
 dZlkyja8ohHih3umb6A7aBGVyFMIo9OPcaj+dbCLzf0IsFpqNrSgw4TpKmBPG1Memn+ifPHZT0E
 Y+cbozmpc4d7VedCYuOxI6HmciQ2h38=
X-Proofpoint-ORIG-GUID: 54yXWZ1WU80QZTYEnT8NnES8R_OqjCst
X-Proofpoint-GUID: 54yXWZ1WU80QZTYEnT8NnES8R_OqjCst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_075238_857584_65CFF9EC 
X-CRM114-Status: GOOD (  31.40  )
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

On Thu, Aug 27, 2026 at 7:59=E2=80=AFPM Praveen Talari
<praveen.talari@oss.qualcomm.com> wrote:
>
> On firmware-managed platforms such as SA8255P, there is no Linux clock
> handler available to determine the appropriate SE source clock, source
> clock index, and divider values for a requested protocol frequency.
> However, these parameters are required when programming GSI TREs, where
> the hardware expects an explicit clock source selection and divider
> configuration for the serial engine.
>
> In contrast, platforms using Linux-managed clocks derive these
> parameters through geni_se_clk_freq_match() using the source clock
> information stored in clk_perf_tbl. Since the firmware-managed path
> lacks equivalent clock information, protocol drivers cannot reuse the
> existing frequency matching logic and instead rely on a direct mapping
> between protocol-requested frequencies and performance levels. This
> creates a separate clock configuration flow and prevents
> firmware-managed platforms from deriving the actual SE clock parameters
> required for GSI TRE programming.

Hmm, this sounds like moving backwards when it comes to keeping
drivers as portable as possible.

I understand geni_se_clk_freq_match() has been around for a while, but
fortunately its use seems limited to only a few qcom specific drivers.

Rather than continue down this path, would it not be possible to find
a more generic solution for "geni_se_clk_freq_match()"? Can we replace
it with a common clock/OPP API? In this way, we would not need to
sprinkle drivers with calls to platform specific  code.

>
> To address this limitation, the performance-domain OPP table is treated
> as the representation of SE-supported source clock frequencies. During
> geni_se_domain_attach(), the OPP entries are used to populate
> clk_perf_tbl and related clock performance data, allowing
> firmware-managed platforms to leverage the same clock frequency matching
> infrastructure used by Linux-managed platforms.
>
> With this change, protocol drivers can use geni_se_clk_freq_match() to
> select the closest supported source clock frequency for a requested
> protocol rate, derive the corresponding source clock index and divider
> values required for GSI TRE programming, and apply the matched clock
> through the OPP framework. This removes the dependency on direct
> protocol-frequency-to-performance-level mappings and provides a common
> clock selection and configuration mechanism across both firmware-managed
> and Linux-managed GENI deployments.

Rather than adding yet another platform specific method, would it be
possible to extend the generic OPP library with the pieces that are
missing to make this work in a generic way?

>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

Kind regards
Uffe

> ---
> Changes in v2:
> - Add new patch to remove OPP rate reset from resource deactivation
> - Add new patch to vote source frequency via OPP for I2C
> - Compress the SPI, I2C and serial commit messages per review feedback
> - Drop a stray blank line before trace_geni_i2c_bus_setup() in the
>   I2C resource-initialization helper commit.
> - Link to v1: https://patch.msgid.link/20260805-derive_clk_perf_tbl_from_=
perf_domain_opp_table-v1-0-61171ab1cdce@oss.qualcomm.com
>
> ---
> Praveen Talari (9):
>       pmdomain: arm: Fix -EINVAL from scmi_pd_set_perf_state() on state 0
>       soc: qcom: geni-se: Populate clk_perf_tbl with SE source clock freq=
uencies from perf OPP table
>       soc: qcom: geni-se: Add helper to set SE clock rate via OPP
>       soc: qcom: geni-se: Remove OPP rate reset from resource deactivatio=
n
>       serial: qcom-geni: Use geni_se_set_rate() for source clock configur=
ation
>       spi: qcom-geni: Use geni_se_set_rate() for setting source clock fre=
quency
>       i2c: qcom-geni: Vote for SE clock rate using OPP
>       i2c: qcom-geni: Use common GENI resource initialization helper
>       i2c: qcom-geni: Use geni_se_set_rate() for setting source clock fre=
quency
>
>  drivers/i2c/busses/i2c-qcom-geni.c      | 72 +++++++++++++++++----------=
------
>  drivers/pmdomain/arm/scmi_perf_domain.c |  2 +-
>  drivers/soc/qcom/qcom-geni-se.c         | 62 +++++++++++++++++++++++++--=
-
>  drivers/spi/spi-geni-qcom.c             | 24 +++++------
>  drivers/tty/serial/qcom_geni_serial.c   | 26 ++++++------
>  include/linux/soc/qcom/geni-se.h        |  2 +
>  6 files changed, 122 insertions(+), 66 deletions(-)
> ---
> base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
> change-id: 20260805-derive_clk_perf_tbl_from_perf_domain_opp_table-2f29ad=
32226a
>
> Best regards,
> --
> Praveen Talari <praveen.talari@oss.qualcomm.com>
>

