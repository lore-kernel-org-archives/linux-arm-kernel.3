Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A73C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yceHBo3nFooDEH2xHhsyC5DfpLhq6tasQh2ju1Duoo8=; b=0CIaZDHjq5pI4S8hyViwuLGfR7
	CQWbkE01lohccefrlV0HG02b1CSz18IZcMafufxTpuuN+WWue7PDDYScJW+lWQ8ZM/FYsfN3mnPcT
	IiYiNtMDpAfxhr21ZfUwRj/nx2tlUb5t+expTyFLjSRFxbyYycDJ+Ira03hvC3Grn6qgezA3a8j5W
	e1q1Y56iqq0q4WD+C455ywALrY1NDiq/TPLgWy+2243Ux3/pgkVaKynoGgXSkXfv2RUJFPp5J4uxL
	NYbIX41ksSfUPnGTlo/z1iL7A/frDzgsmgp8IRYGPfgmPiSNchlkj/MCuOT0xxNWBAQlDkFZhMWUL
	5poYPzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxGf-00000006CVP-1yQj;
	Mon, 17 Aug 2026 13:20:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxGd-00000006CV5-1Y6d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:20:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD687a2329989
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 13:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yceHBo3nFooDEH2xHhsyC5DfpLhq6tasQh2ju1Duoo8=; b=d9jN12bhgXLXzXem
	VEdveKhdGhqe5nLxCs5296huHVlr/aYrcr5jRQF/aTcs6/VgXK7IdpmH++t/CEXM
	3tGAXCXEAvPba16A5/Lk+UHWmVAwivmyjzJl0qwKkEn9WztqJkid19mIbMW0gjCA
	qPG+sn8wuFPf+/x3aFW3VLBBVwgL2Pg2ePiBzmMBC/+IQ8FZgzG5NMnB+N92SHcW
	u2Iy+DySCSb5rcy9gHLZ8dZOyF5TmgpOd6mTO7wQRxtTgA7wkahmWLIL48otdy3M
	A3svpb563B8b44/Omh+6vdDAT+GE6B0vX81r3wxSj3npbn7kftMQ13j6Owlk/goI
	4u7Beg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3vghssr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 13:20:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ca37ce4c3so3867151cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 06:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786972842; x=1787577642; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yceHBo3nFooDEH2xHhsyC5DfpLhq6tasQh2ju1Duoo8=;
        b=VoP6TDimolf/VEwz9X8lfGJo7zxL80UpcVXTskceanxC0eSsDEkF2QylPV7uW3GLeq
         NrBKa4WwACOEKuXDpKITPQ6NHS9aBMYhOR+KJ/Ej4kOj6+uZhIdxlY+AnmpZLEmS9B0u
         lj1F5iqIuNrLx75cSajUjabELZkkFQOIFQNJHWtl4Gv6y2GUr6wYl31ywtlhFrFr0hmp
         xwrePokvZM+qK7rrAyYz5X27zXLLGox0qLhokJnFRzRJkJJD1BDnGexLj+E2w5GfDYvT
         2BsaX/nF43dsHvdsZrsEvkq4j01QITMDgNTHr36OUBipei49mT2CHBEUk6C3KGv+qqjn
         /M4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786972842; x=1787577642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yceHBo3nFooDEH2xHhsyC5DfpLhq6tasQh2ju1Duoo8=;
        b=Ecje6YxaN2yhA+tqYg08eacslUJ6NnxLZlRqApb7a1PRKB2bg9duhHfVWab4S92lbx
         BK7bYB1yg7dq2ieItWf43472KkmtR+tZj/JUqMlWXoA0I+alY9yG87q7cx/YaQfRmype
         6DKc8kYUGNE6kKdnAEqCHCmWp2MVVtjllR9Y0c5A3marCRauz4GezQw7/sCYpl1wue0s
         GtqT1ABD22RsuLl3NFa5D7SbF/JaHKT+DOkKD9STcfAtC/oDnrJ+lcBZEG8EGxNkW/6R
         JghT1ksCVhqhYAET4aahc6KbeBM1/Bvwt6qHJGOvTmXwWJ/PbRsBvX8EFTwTExGslrMZ
         yZPw==
X-Forwarded-Encrypted: i=1; AHgh+RpS6qSORzYb8zDhNk3zXpeEb5M7i9Hjze0MwkgeahSlxmuKcdcYOkvJrg2tn99tZIVWHZh6HYyeXA/Yg4TtC6iU@lists.infradead.org
X-Gm-Message-State: AOJu0YxFWNvNJbgGhTIEZchDmDWiCoZPEy98qBJtTfGUW3arW5/9umc1
	YfMJLpnf9IAic8wRv/il4b808haCLlRTPLDlloNLtZ11nC0SHTT7pVLgUepKTPwrEblg63T5LQV
	0j5TdDYqVGVS2H7i1q8WG1yoxA7TNUnCtZ0CvL5Ms4JdQlOpufcyGxCzHp4aq+HySB4xruekf/L
	5QzgLs4EX3Uw==
X-Gm-Gg: AR+sD10oWF3DEmcgeFpCnhBXpPMBmPOoKSzPqO6fcfIgJwrYg4uCzgwL+aa49Sg0ve2
	bCNj2hMhfCVhmq6/N7HnzRXlX+8If/iXO8y7264YdxAueZtC8Ff9MVNxLN6JXVReimLdXtW2Hpg
	qbHfALG8o32GE7WEe8ei7WQqk+qOeGbGoF/pQ25fZjrDk9F9xGMcZxqzD+r3xsuQFaYHD2OZit6
	Zino/StFlcr8qXwgD+kP7jETe1C42J0FYU8Ud7uEY73H6I3F/jS166clT6sPUa5witGTAbgU+s0
	eMszBldXBgS79cjSB15EBaChv3Ksq+WuCWXIPw4DewH9FfdyjCYO5BYE3cDRhCco1sgG65B3fE3
	zKVsMKmug7u9zVW/ux2YHXUSU
X-Received: by 2002:a05:622a:2d6:b0:51c:2101:f0 with SMTP id d75a77b69052e-52d8533db8bmr193422541cf.2.1786972841721;
        Mon, 17 Aug 2026 06:20:41 -0700 (PDT)
X-Received: by 2002:a05:622a:2d6:b0:51c:2101:f0 with SMTP id d75a77b69052e-52d8533db8bmr193421921cf.2.1786972841183;
        Mon, 17 Aug 2026 06:20:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fea1e64sm60193666b.21.2026.08.17.06.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:20:40 -0700 (PDT)
Message-ID: <efae422c-51e6-4dea-aa80-fb2669496ba3@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:20:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-3-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-3-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=6a830aaa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ugQu5lbr4eJmBGCNh1wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfX+hDBBscQcs9l
 ZSiBdeA6OvPNsDhEa6BFtw1y8F1Nh0PIAv+LAtg+jrSUxsWTZdS7UwCG3gCPkISgn9H6O6/W2aC
 UcHfHQ5yn7nJWatAjNLloKczV0ocRBU=
X-Proofpoint-ORIG-GUID: dZaLerxh5pBknlIV7D5a0BvPObkgMVqO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMSBTYWx0ZWRfXwtlPb5hoDGyx
 ZYLiyhKWhqFvwQ4xZPuDuvrzfIp3auVoX+tKJ1KAS13tV/drTBewkgaku4NiOlbMMFQTWMArIZE
 L6zSEykKFDIC64tfD2eUr9mrdtQHwZTU8PGVtvogE+MXoQcxav9dqyDWcYudJ4cCxERui8pBp0c
 ugDX3DARb9IvKZOgTo0ARBDjQrxVWSbfdrhpN8YYn33rb0LiODL2/YuSjYUeaIrdxktO0YiOmW+
 3XoVM3pY5zPwv4tRObZWM+/AHxiVxoDw+wNcd8+KqCJB9l+CWPwgI7PhXHahpfURo42qfh9lWOK
 6eHoRHJVS12x8UpHDZ1AT7VKzIVSZGSPNd/xSpDZiE/qP2sPb1iMPU3HnASEzWHD61MLftZz3Fs
 wUgxbF/UfWZMeHnstThihMqrmDhPcpRt2wdxvzJx8fu6ZHDMw5wAMNvTy9FH7/JmJW1NaGOlQMl
 DfdSIM/wVxgtx5AOxsQ==
X-Proofpoint-GUID: dZaLerxh5pBknlIV7D5a0BvPObkgMVqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_062043_549948_1175503D 
X-CRM114-Status: GOOD (  10.76  )
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

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
> new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
> exposes CX, MX and MXC domains (including always-on variants).
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

I believe I reviewed this already

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

