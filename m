Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AE8C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 14:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=; b=07RLrPk4XDWvjgkdVfDh4e/vcb
	9NstvXoCtn0N2iDMLJArfZEutmmP/GVjV2nbn11UwlDOWPP718EGL8mJ27tiMuKEUnG2DoOskJSeK
	WLyyrpttL4vBaUrlaXlK3msEspH6AIaWsWztlJap4m60vVyWExIFmGFCBhexDvhVXs6KYJ+Flxq3F
	tfph9linb8qpKjJFB0Rhyng/+MrtZLtZY3u0UA835zGH0TKWTUNpgDUqEaGr0dRh2f1ewEhreig4L
	VQAVHCfNjveQ3fhNijkIa33WL/bPAhB8MZyVz26Q/sOt8tsB3wFpU2eKvaAVWm7LiwEFWhz4xzbtO
	HtHlIumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PWf-0000000CLFw-1Kxz;
	Tue, 01 Sep 2026 14:31:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1PWc-0000000CLFU-1rp5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 14:31:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8XNM3256375
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 14:31:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=; b=TWKV/SbgV9p0gmBq
	Ix/czCMtVc6C+fPEUJMX/wN5rmWOaY2sWrV8k3FCPsPVdBHPZds82x79UGxpCqCp
	/pVpjTMlX8ruOOfAB4pzE0il1Minieoe88KD9Sw4VJi1bgOh+zoS/6IfzDz5g8KM
	J4padN2WR4QivG/XXxD+bL//mbXyEPOzB4v81QzF5er6+cvoinwDYAqvjPEBlKjb
	fjX5HcnJIoAASFUUS/1g6Hq2e6QJhqKeo3LNE8Ut9OkR3ueWUadOU0OQD4ljSMCK
	j2mGoFWfUxYrnESW4/FvIxt6z6yf87rCmLVgMvOg92INvotvppxD5od8KkAFNDZv
	mmzjXw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt09x2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 14:31:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8535cdc2433so897504b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 07:31:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788273104; cv=none;
        d=google.com; s=arc-20260327;
        b=gvXPCeRnYdCa7Gie1cjON6HS2XUeO5LSNpFbllqKJNr4M7nYBNvYS+DaqdblXR8m+Q
         qO4nfPUWvYkBC5Q77WxWB9MsoDuWDKXmYBzmYAyxK257wDYdU/LqdwpOStmrtEiSy79v
         d52QyCeGg7ylgvxD2htxjGBQdNifvHfBRbaA6xbY/rLWsAQ26c+OREwBlx9OyMj43kYX
         3iiBTwbiH2xZNclYW6223XPJszGxVIFh82mjwQ4JKs4ARjAoqAXS1YFn41P0n6b/hwRd
         T82CCpQFCAG8jHikNHoBxnuXk4fvXZhZaMaq09bV+k4tVCKglw8DyFfbxtq1E70izuN9
         SkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=;
        fh=oyy5iFNiB20JIdpS3LA5rSfCHv7RQsXkTjIOB81jib8=;
        b=lIdNCaSNwHbmcKWtQMnyPJON0hBHEdPfyLWookK/zyYSfE/Qu6eSOGC1TsaDg3k/DM
         YDuZGnIeWjB10Gzrc3ajPWwWvWjtdtXuvn5954Sq+d8X8rjIW2N9MFlZeeL415uccJjr
         rUmtl1RzNLB3RHBF58RDeYsGNXSSQBzkk2JMWkhGCftXgAgIv95z6gBpo+ZP51HZuc1w
         jxsby9cGc/gkyYipY61VNZmW067TVx2IjB598cchPWs1aIPoZ7CuigblfjQroNvheTgG
         eTEjQB4SCOwkef/S6rPHWdCLLZU5SQCv7P7QOCmhbR4p8a+RrEbSmVXgXu4YIlRXaeL7
         kZPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788273104; x=1788877904; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=;
        b=hK7KHvnwwXyl4wL1LZoefWQufbgwBGF0Z0d76/mDBp2H61kHbMO6AwwfrMFbSOZRYF
         K+vWo88GdYlgaXUOtaZUY+I/GsHNiCDNIhkmczldnKmb4NCnnj7vYFgosj6/4/nwItwz
         34E4njfKo3fP0NGisXo+AdLvvOxn8LYfjS6aI3/g3hFrQ8+taDNdTZNPDX4GTdjKC3o9
         RBkD985282fOhhchRXs5tuXKldxhzctmZSkIVZlfLEn2VKkBOrDROMSDTZ48WOccEWP6
         KQ6KJPnyrGlN44Bo6QHhnGaPzLiKE3ijj5Z5BjuuqoGux4M6AhPebGKx3NFdJNSSdx2l
         gzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788273104; x=1788877904;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzV75RyAsYZ+frAuiZ8woVoIVYpRn/LT5APqR6Tm2RE=;
        b=LvK2szwv8VqQ4/3jAJg5Sh4cXgqIVUEdbho/riHJJrTDkIqRXLwFXgVSAdMLhVYgH0
         ruZpsVJ7okuWqn08gPh7L9c1F6gF4Aq7NTvO9q1r01Aor2HXJZMcgt0/OwG8Ca4+2j/D
         hL2losRK7ccZh9LFhC0RLZl9sX2j4sa1DntHnYhn9iI6HdvfOmxP4/lu8iLrUW6L56nr
         Ci6S9+QfrC2ZZrQxcog3GwTsdcJmIGECTRWMDTKA4+fVg1QZq5i9xL+gHvLNAVG52WPD
         HkRpe2y1RBslAZgUaUc6eEsdmYu/EIMFoIB2AM/TYzFdmmBnwBGmTEU+bdOUd8LNwHUV
         f69g==
X-Forwarded-Encrypted: i=1; AHgh+RpGEXqWu1iIRPuY5JlAsXkfENDKi8mtWSzqtHCJdPcAzLEmck+gN2t4soojBECVhyn9TEQvoZxB5W+14RFd7oDK@lists.infradead.org
X-Gm-Message-State: AFuF++muCqRUQ1ZSvyIVvU468xsH4HAh6eEMcAOxf9Xtcugl7DolCHm3
	fT8vopAnIN5rwD4MslN3AMRpkWndNsr8KnLNHXJJcZLk1sZDl1umQaBHIWidE8OOA2Wnpn6GOOK
	nqBIXyvETkjT3DVjQL/AW3FBnFXSdpHGqqfXqBq37C2nF8yjIVRD0HXQeeLMzN8ew6YpKS4poFI
	vMtLLAE23fLUE45yDSCbWl8BgIJ2cPvD3LmzYTzr9wY+VcIOiRUhUz
X-Gm-Gg: AR+sD132Bt4XfEU0QPLh1IEP5OIRNr1Jh78NZrvTQtO090UsHj+D5K4zjXYsA33PTWA
	+15wyhPjuGUI1S82IsOTDdR3ljODeN8Fh1fhwplghHWsUNyX4m+GtcLsStV6JgLwkEZqvkBQN/5
	o97M+A8kKPalXkE66elINlAiLBgd4eKnlGoMMGvyaH3P1kQUNMBJxQZtnMBg==
X-Received: by 2002:a05:6a00:420f:b0:854:b3d3:8631 with SMTP id d2e1a72fcca58-85bcacec88dmr5178992b3a.12.1788273104243;
        Tue, 01 Sep 2026 07:31:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:420f:b0:854:b3d3:8631 with SMTP id
 d2e1a72fcca58-85bcacec88dmr5178917b3a.12.1788273103642; Tue, 01 Sep 2026
 07:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-1-091697dbeb02@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-1-091697dbeb02@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:31:32 +0200
X-Gm-Features: AcwNN1WwQtMTDpu5tktdI1Fc85e8Ltr3tWd5G78kHHK2UXE66ekj0IR3sGBbeCc
Message-ID: <CAPx+jO8HQj4PtBScf-w+nQz-9xe+7QxZLMtp=J=sFSwEHVLL_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] pmdomain: arm: Fix -EINVAL from
 scmi_pd_set_perf_state() on state 0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyOSBTYWx0ZWRfX2AueuH5yKKaL
 QVo/7zrN2z0HZ21dk95uhr+Yn85DA9BjXUqWWQZ6v6SEI443Fj2u0zHDpVOvzf+kFJPIMYVtzF7
 YKoeHTmfKyfJ/i9F6gszskPGxdtS4tM8AzRMx4RZC5tPrGpE6ZRbFSmAW6MrFXNg46A/tFPvdAt
 F8Yd54WxsnVnwBGtEGVmI4iZQ6yyF5XsekN/ZjD8ULu/TVRH+qc1W43uD8kzQV3iWT+FYf3rWX5
 CF8qpcN+l5YEcnvS7cQYQa/CjUiSdKk+o9ITiSKEGE8JTXa9u9Ba+0Xwo3SQn0QdMa7i6taceQv
 z0qldV51T2ltoyvJMOZAtSLhnViegbMrg5cj6+xku1etMwfcRIMLWQ4x1KPfWttwlt+TbpCwrnT
 dWxwCUycwJnWon5veyus/l1RjJcMUA4/3DiEn2KsfkB8XhrlopDFAKjfnM1iqoAN0f8q64oKN6R
 MVo3fEouCkBImD4EqkA==
X-Proofpoint-ORIG-GUID: LbWSyfIdDn0KqkHCvO57grFXR7MqmQ29
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyOSBTYWx0ZWRfXw+ml3GtCz74I
 j7+mQvi7RGQ3n+zGyuSynh+t/96W4MILmvfT/WV/K7vAMw+sFoCWDiJS+Rj5Uq1JrUp0RVXAysP
 IgdcEO0OTzreDjlDSO6DXMvmzoqj2vU=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a96e1d1 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=iiyz0f3IVUh47B4zfGIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: LbWSyfIdDn0KqkHCvO57grFXR7MqmQ29
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_073146_598142_9E03DF61 
X-CRM114-Status: GOOD (  22.63  )
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
> Currently, scmi_pd_set_perf_state() treats a performance state of 0 as
> invalid and returns -EINVAL. As a result, devices attached to SCMI
> performance domains can report failures when relinquishing their
> performance vote.
>
> The OPP framework use performance state 0 to indicate that no performance
> vote is required. For example, dev_pm_opp_set_rate(dev, 0) is commonly
> used (by firmware or linux)  when a device is runtime suspended.
>
> A zero performance state does not require any SCMI performance request
> to be sent. Treat it as a no-op and return success instead of reporting
> an error.
>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>

This is already in v7.2. Please rebase your series.

Kind regards
Uffe

> ---
>  drivers/pmdomain/arm/scmi_perf_domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/a=
rm/scmi_perf_domain.c
> index 3693423459c9..e390f902a444 100644
> --- a/drivers/pmdomain/arm/scmi_perf_domain.c
> +++ b/drivers/pmdomain/arm/scmi_perf_domain.c
> @@ -33,7 +33,7 @@ scmi_pd_set_perf_state(struct generic_pm_domain *genpd,=
 unsigned int state)
>                 return 0;
>
>         if (!state)
> -               return -EINVAL;
> +               return 0;
>
>         ret =3D pd->perf_ops->level_set(pd->ph, pd->domain_id, state, fal=
se);
>         if (ret)
>
> --
> 2.34.1
>

