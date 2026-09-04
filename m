Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701B5C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j18BJPt/DvGT7g3N2UqsrZWAWZ06VMwJihvlhh2lFbc=; b=wmHG2b79D/h+cSbQtgyG/16xEt
	gwKKDDFOz3TuOb459iMbg4swpLpsjuy0Vp6gTuCJr0fhHCLmB9hxEE4wz6XoFbXMdw6IPEwyFj7EM
	99OY5ikeDHKT29xsXp0FyjRC/31kHlyoOtAyP3zfDCmYG4Y1h1QnEaG4xq/EOZxIPdaKcVdOt2YNM
	L+4ecHz4BVUmBvUcB88BpKSSdxRjxhMce8g82Kw7cSrDwypj7KaGWYxWL4MNDg3F/w/VXGbPfJHJp
	CiNz1FKu52ipijbBq7wxc3bbY3F4Xw3PeAcDBeGg7c4wVM5U5EC76aqH7JTw07rW9Gkm0DWtaDb1T
	9LkCmkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PcR-00000001SNp-2YXG;
	Fri, 04 Sep 2026 08:49:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PcN-00000001SMO-0d6t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:49:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847msZP2292546
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Sep 2026 08:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j18BJPt/DvGT7g3N2UqsrZWAWZ06VMwJihvlhh2lFbc=; b=L3rY66/ZPsUMtp1m
	yZ5+t8eehR1pILzku+yzJTRv9c8fPHtBIRhJAtktnQcepeykDJVJPP9dFR2egT22
	WMOXcRbe7Va+vtP5a2Tw5XvojiVIYPLjk+2ee/Q+6MSvITBw/WKAjdD3LvXvVF26
	LHt+lhPazQ0+TsN/VttyPFw27t8eLdEf22Tlki6wwUyZl3ujIeNXuPW7NsMR+17k
	RBztDGxY7tL+s/J3A3kCF348jxqh5vXyDwFaa4WQ+fHJXk80JFxJ/g66dtXvCviO
	mvoG7dfdtvdRnFPa8nMAyyN5Din8JuJqzFYNdbhOwTPy2doKvYdhxWwtaGTwxuOy
	WGtymA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfdyp2t4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 08:49:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e661ce1dcso13792485a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788511790; x=1789116590; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j18BJPt/DvGT7g3N2UqsrZWAWZ06VMwJihvlhh2lFbc=;
        b=DRfxqlpwJ3fAk2O/s+78EOLaLa2PqX9pP1EPVbHEtUmsiOtpdznvnMvNhRizfyHiUS
         AIwjDppwAAg3Tv9E1L8DcZiiJeRwgH6GMrNdMNasnoY9pxCbTiLv0frkC+5W4unP/kRp
         /RsJ+s59Y9SQojv4RjWmgTNgJHUqql6z1aS6ki3KazgMGwy3WH9rGRdxpUrUz2wHkAR5
         UcOAHMu4jShVKtR5iUcxJYZHpQ3woY1D0pHin2bqr2LuREv4r7DHglSOs2wL05627HoU
         flA+c1AhgI9LQZCLh6JoPq7V18SjgLwKVkdQkt5RDPzPOSOfojAVDF5jEXaiAIB9HfFC
         ZvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511790; x=1789116590;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j18BJPt/DvGT7g3N2UqsrZWAWZ06VMwJihvlhh2lFbc=;
        b=jnR//kGy5vLl90n693noIcAWACcbYHzgMgeKafGAev9Nd8e7mwW1Yygb+pvkBWVfmV
         Nscua/eRwlymvODAE8/j68X1nil0z/ahcNUByt8GrUfELFmPN6TUBelygje7GDhOIER7
         MZ6LBJ8gK/dQVtLERNAGYduhqAayJlDIOxa4K4rvhNmtYLGAV5IKxNDcyJlVLhle1/fY
         E7r2NbtsllDKLv+/de0kx3i9Vr/X+k0IsHv128zo06VZj1U3pQUUPMvPmeTaKyL09oxQ
         dH7kakq1tPNfTcQqu5TwhTX5mlxV++65zSi45Ut6Mm4ZT+ssbVd0SZVGgDdEskJpOkCP
         fp8g==
X-Forwarded-Encrypted: i=1; AKwUvBxlBzp1914F91VjTeSL5qJk2QXP9a3Dr6rGTWr+BTRODPyGeBqzFRP6Uz4Frl4+res0pm28Tx8qDt71kwOnmaq8@lists.infradead.org
X-Gm-Message-State: AFuF++lUW8uGqv7TToqh6Lhuzj+wxgZDEsZOIfvSLNUIB3f1ubm/dF30
	xS/hDoi5SAbVXAQq4BuucgHwv+Ej4IMBukW8P1+DX6V4dZLHvjgtADbTwjN3ZPog8ZN8Qaa6KJ5
	nBz+q/lyIaQ48kqh3NO8lL98od0Expd911OMbxsaDeF0JArTl4t+0IBI6SFXtE6d6rzQiIyB+f/
	bm08d5WlwJCw==
X-Gm-Gg: AYBFou2OG53/01atzlRs45uZOpCC9uDuli1VPexrtbl/Z2AE8zU5w6z8Lc7WcPLcbeE
	qsq+NSBctz57Dz9+hwUeyX4vg+5jORjF5zgSjn6x37Z03fpncIVm47ihyqSQZWxX9XP567QBzAS
	KPcwmcf0OSH81RhYaoIGb+flKiU8wOromeREXipurnPbpJWFjGIouFhmsaK75fuoMTaVFdzVe2g
	QL3nsDCIEIYJC2hgwxYBMpf4VvJ/8/MwPM7C9KP5p7ihYZbyng5+MAhn4f2iQAt+1ZX/WvanLuQ
	te076LKBRNJGnz/unpsBgxtC8HZr7q1q0ICNn7aQ6JVfLhzkMV0g/JiAKlbpDPpn2sI8zL1rp2+
	Bg4Dj17pjHMbih3iXeWkHWQ==
X-Received: by 2002:a05:620a:172b:b0:939:85aa:dfdb with SMTP id af79cd13be357-93985aae0c5mr146195585a.6.1788511789685;
        Fri, 04 Sep 2026 01:49:49 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:85aa:dfdb with SMTP id af79cd13be357-93985aae0c5mr146194685a.6.1788511789302;
        Fri, 04 Sep 2026 01:49:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6a1dsm867795a12.7.2026.09.04.01.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:49:47 -0700 (PDT)
Message-ID: <813aae42-22bf-4029-8f04-54fc555a2a1c@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] soc: qcom: geni-se: Remove OPP rate reset from
 resource deactivation
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
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
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-4-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-4-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7G6l6zHpTWMDrYnLqAqocH474QoF5qHI
X-Proofpoint-GUID: 7G6l6zHpTWMDrYnLqAqocH474QoF5qHI
X-Authority-Analysis: v=2.4 cv=Q5XiJY2a c=1 sm=1 tr=0 ts=6a9a862e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=9QLVM3U_lBk_t3napV8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MCBTYWx0ZWRfX8qhxjVNPXOvd
 lU2TqpPXh/uSc8rpD/HHo98JCur1x8lo8p1kMXQxPT1Xoa0bXZKwap53XUGpdlLnWOs2S49Iqil
 TohL+xXXYeG1hiLcRAUQJIPLjSQU0WofGa+qgyksfK7FR+y1JVJh+N7ADOI/25+uUBWeZu6BHnU
 U3Zvlc2q+m+YKdo+htwAS1HbQ2SOkfmWfCQjMy47MgLTcgE93IlRhssRuVQISc95pHOcchPPDmY
 bg/j8cnKklnzE71J1/a6CeY24WF4CCQpEezl9tISulPuQf8j3YUCFRkQ3MckD1EskkEJtLrZvcY
 2xYFngN4ilvCCiUBikr51SV3bGSrrQXzbuTqmh/ao4NLCmKXa3mox7EESoPh7Eq6tXX5gAifaMq
 sTva9JdeygObo9fYMu1gMyX/km61RHGaE2LQbOYfOmYK/99kAs7ff+zTzhJRbctRJQArz6Xws0T
 pHkoSqiYm9jkGI/ozzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MCBTYWx0ZWRfX3u3peIQz3g7x
 euGcXZitKNomlgVbcA1exfHBSq8Di3IatUx2fAxnzvlGd48yJGSO1oIoRd8ciLFsZAFW6ikymlG
 +NA8TNnEQ8FVj1AVTw0PrTJfW3lzsSs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_014951_197949_28CA94A3 
X-CRM114-Status: GOOD (  10.56  )
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

On 8/27/26 7:59 PM, Praveen Talari wrote:
> Remove the dev_pm_opp_set_rate(se->dev, 0) call from
> geni_se_resources_deactivate().
> 
> OPP resource management should be controlled by the consumer driver.

I believe the opposite was the original intent behind creating
these helpers..

> Additionally, clocks are already disabled by geni_se_clks_off(), making
> the OPP rate reset unnecessary during resource deactivation.

That is, on the other hand, a valid reason

Konrad

