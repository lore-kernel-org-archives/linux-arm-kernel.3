Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 800D5C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 13:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbp8mVQBGl5z09DMV5RCuEsVUApOEzt1Ehl+hms6Mj8=; b=xunmsyXrVi59C0KcJ7AgGVELHt
	AjmbyhIf8/88w9vyAM6rI96GLRRcGRrz8wDbvI+BUN/nfQY7cmUz4qRpbrGUBJJSM8m8Y+3OG1nt8
	PQFM1S70t0q4M0632s+n2pIqxXqFq+QgJVvOcOuCL+x+bcgRvbYuNZ0MQeVvxT2I+0GD5oy/nNR+f
	YXt5/QoaBqE4ig60v4gueNTLEQsxMqKj1eLm5R9cBIMPiJ06kri2XkefXd85WwdqrqkXiBgwByOBs
	FGK5sofAiR/sz0u9aOEZMtQd/9XPLpYzJlA8TUJOvmCw5zyE3wM4lTjEAL/cbsORehMWIzcG+nsQV
	Hr3dlHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFQK-00000001xII-1sAP;
	Tue, 04 Aug 2026 13:43:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFQH-00000001xHS-3ELn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 13:43:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674D32Bf4031701
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Aug 2026 13:43:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nbp8mVQBGl5z09DMV5RCuEsVUApOEzt1Ehl+hms6Mj8=; b=dI4ZLN5nAyQ+W8fx
	j0sKvwTO2exEedRbGmGiQorxFmf9S/+d8HSikRwTkd3wOaVj9WRZgT5tEzitjwtD
	83YQcgdGo7wx4vWkYPBGAfE0iLSBjEQBsF5CKaN9yiLse7GFLkHAhbgElT3Q3sbc
	NfRkqQK0c2Dkja+78VIfN79qqjTwECAxdjfz/4FuRiSklY3LyJZbP102yMMXMoxr
	nz0nS1gcohVdrosVtWamhgNn2bXd9gSNRaFsg78BQY0kQaqvAij8HgIpTwGG3BgS
	vIYYdOXo+OjAqtJMZQmRJE4Xxf/kX8RK9ivN/qzyQ4ZA/apONyhF5dvJbPmWp+dM
	zdcWiQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fugmg05st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 13:43:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ee593a5a2fso12623946d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 06:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785850992; cv=none;
        d=google.com; s=arc-20260327;
        b=lzJbb+zMG2GybwcPsi6zESz1QWDKRfFe07l9Ps6WPrnPym9vddfEWdV2Axh6nsJGWi
         LDPfxTf6OoQl5FevIYZzm3mITianoG7oUSZicY7WZM3BjP54Vm3slCUMzqZayYU89CLi
         SN84//y/N+h6+cwa5c5hxA25EqcXvaYyMj7Lm0ycRjRlHoniApPx3xxuJfoqjbLTVPJJ
         puf4Fm02jHYSjJddTtXLoG7ebZiekfY8cRSzflZg1QrYmcCK1xVfHiztQMfX9xKuDzwE
         v3O3YAmbeRnnFHAs6UBBZjiLbTWcYhX06I0Htpx9ZqHnklioueFeG1iMId022cXLJfl9
         7ZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbp8mVQBGl5z09DMV5RCuEsVUApOEzt1Ehl+hms6Mj8=;
        fh=mE1UtqUB6x7EsI2PNJJ59hBVOYcLugzg/oE9C2ua/54=;
        b=Afy7TthUfnVFyuzRMF3E/03RReqMUSEKNuaMLst9R0goNh33RrTwgWyeMRhJ5M9C5s
         9S/JEKk1PLy88FNIJxu3GI4+u9z4b03aBaH8TLzTwMCA/kVd/AdeM/FkqGYHuESUftov
         2sBvPm4eKhRk5rpLth+RoGjjIFynFx4advaPeCpZqFxrqlkAMT7wnf1DHf4FNtDezseW
         sPG7gSJC5fuNt+iV1I95bHoo2at+A1yGbAAICi1p08ice5U/OLUAfKY3MeMRCua4X+OJ
         bqxjWcyoP7MlSfQY87GmuKT3NtwhCkw5HgQvPIsWluMTAsTWxIzD4JqOWz6CYVMEfqVp
         uhWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785850992; x=1786455792; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nbp8mVQBGl5z09DMV5RCuEsVUApOEzt1Ehl+hms6Mj8=;
        b=J07jsDDbq7pg7PYUQd9+eCXlQ5AU7A60o9LCoHwTuMq5BsnFqSObvXMDbReqC8weIx
         NBvxFdRo/b4VIiIzqokhdByXvMX7oyY0RQ2akIgaSnc+QhQVZT5ZBcY5leU4VxSdtmfS
         Sl9k3fGB6fRifBFjv4/s0pZv6bEbpcNzZnPNA9fbfH3ge5dc46cfEIhr/ckuiiTb3cXk
         /Q60AzIboA7IKEjIGw548Y4iHhojRBazTDzpj0TVXU6eoTq8r94XLDXmkUrTf1x3f7lr
         dYQuVtTTSG8XcV9yL2DuN4MXc6k2jZ6XfI9ksLfaz7RXEbjT9aD7ax2PA5qYn8knXf8p
         oFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785850992; x=1786455792;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbp8mVQBGl5z09DMV5RCuEsVUApOEzt1Ehl+hms6Mj8=;
        b=sCqASqbx8Qo5T7nTU89jUHSnAyX3cmdJJBYuU1TJCBM3z/hOzy/tLcjyu8m5Ca173v
         p9hdYwWvk6NmTBgCCw1jwlu+nPQxqnsbmrtOj3NLQeR6hR50QrvL1tLL0x9vyyncSTnz
         Tgpz2RD2S9dvE/FfSLuJXg29PJnncZUplF/B/MH4eYDprUlqTlzRxeFAyhPd4Rc94S3V
         tPkmwAk6/B0Qiemu+rcjakgBwWTM1Vt4o47TFqaxslVmnP02EVgcxxem83dJfW+y+O9/
         jZ5l2a3KMZiMh7SoKh56/M+/96LRMoyWJO4spjhdwBmpSaCLJ6g9Bn8Fsc8QpVn6OikC
         FXOw==
X-Forwarded-Encrypted: i=1; AHgh+RoObnoeUnfC7wr/6xdMVGRJMcwELLfiJQddaDUQzfpTaz+aswy0YDu/ZL1WBDqrYACCNs5Wew1S2ns/joH2bbNb@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgtx3WfuW9VCqROfhpUnv7j8IJD7VGGEKwExO5xSyXTxycJBG9
	yLJp8yjkBTKoBynKxAxTU2qmt4XGDxscGsuA1WbtJhEMgpxey8t7yF7ohubLL/TQBOnl2Xh07MR
	W7thnnAVWD+bA0c/NU3uiwv6h12/gP9giomKow1L5Y1Ech7GKn2ja8qsgfhgh6uWwvbcESO6ZNx
	ODgn1vh5/j9Kj4kHcrJ7TBP4fKkLDwqkrr4vWsd+17agUkmPqYlwJ2
X-Gm-Gg: AR+sD12qrIlkkqeohdCBFJYJuv4QCi+Xr0/7SFz/3zA7B8yzGyvk++U+j0VRv+7Fagq
	HvR++pzcafoU2gvdsgk5FBV/4jHEM49KWqZsns8K7DfMYoI8ggrQgx//iI5FgT1oS2Skp4f/rf0
	+BRdNYiVO7qtYoh6ALOSt4cH6SwZJapEmCUgzYJNdiZFGheBSNP7BiWgXV0w==
X-Received: by 2002:a05:6214:5981:b0:908:4249:337f with SMTP id 6a1803df08f44-90872b6c49fmr82414386d6.5.1785850992324;
        Tue, 04 Aug 2026 06:43:12 -0700 (PDT)
X-Received: by 2002:a05:6214:5981:b0:908:4249:337f with SMTP id
 6a1803df08f44-90872b6c49fmr82413736d6.5.1785850991910; Tue, 04 Aug 2026
 06:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260731-allwinner-a733-mmc-support-v1-1-e9209e3f9761@baylibre.com>
In-Reply-To: <20260731-allwinner-a733-mmc-support-v1-1-e9209e3f9761@baylibre.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 4 Aug 2026 15:43:00 +0200
X-Gm-Features: AUfX_mxFXZDTZA_oVlCI23bLtNdk-8qS8d3T_pRa8l2TAPJMQc0QtFw5SglOqh0
Message-ID: <CAPx+jO_Me2qHx8UQF7059Q-W6cyOtnw7ov-CnMhYo5d+9aPKRg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: sunxi: add compatible string for
 Allwinner A733 MMC0/1/2
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX2hqyS2QrbJXF
 H2p6l/oBROm1nbQw2jZ2oyGIjGhjTBCrqNBtEiDvhBl0NO9xJD1wIs4qtWLVzs/noZikDmomylD
 WxtPNHtpc9Z12y+FCjO87m4m2BMVWRs=
X-Authority-Analysis: v=2.4 cv=F89nsKhN c=1 sm=1 tr=0 ts=6a71ec71 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=IpJZQVW2AAAA:8 a=f_oPU6YZfnA6fFRCD1IA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: RPXYQpNmSIqWU-SWp87oGtEvkL-ipUxH
X-Proofpoint-ORIG-GUID: RPXYQpNmSIqWU-SWp87oGtEvkL-ipUxH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDExMCBTYWx0ZWRfX5rECBPiBjJHZ
 XIMoQ4GiFjoOg4FFNbHqDV1bR1S4+cKXwBU1r5lUP5Im9BxEiLWVTPrcnkNnFkH+Xil1hIa/IUR
 f+Xjf6BI1hxAs8mgzlcz8ObQLhvjvEFaNuDPDvijKxoPIo4iPBmC4QKg7RGmsr6nWUHUjCM3bPf
 tfIDAHB6Wg+pTM0rhG3HOL6J62jspgH/RMEv13A7fAeJD4BgXMBJMPbcL7vIqMprrOLjtaZ5APF
 LCdA3iMGWdK+YXypWWeVMDmfZlwcYRq1rrHoNdEBe6FbKahclOQjy0RzV5lWWBJlc3IBEYvBRib
 06MeOMCcDxl6EEfLXY00Rz8HcbNC8JOi+aKycEadHxysYgTe8jUepo25ZmGfar4J7GP7vzT0xp2
 tZggWv3DYXVCEPbJaeGLA7Ol1wYV30PgCRfmhvI9rRZlHNTUOm5byKMHgzuNKCoEUvU8TQ+a5Jd
 04FJpfStAXyPCDuUoBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_064313_809873_04D7CA9D 
X-CRM114-Status: GOOD (  21.26  )
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

On Fri, Jul 31, 2026 at 6:22=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
>
> The A733 MMC0/1/2 controllers are compatible with the D1 ones.
> Add an A733-specific compatible string, with the D1 as fallback.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Like the A523, the A733 3 first MMC controllers share the same IP block.
> The 4th is known to be incompatible with 3 first.
>
> Unlike the A523, the A733 4th controller is not dedicated to eMMC.
> This 4th controller access the memory through a different bus. This is no=
t
> supported (or tested) yet. It will require a different compatible when th=
e
> time comes.
> ---
>  Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml | 4 +=
++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mm=
c.yaml b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> index 9f3b1edacaa0..9e9610bb1eda 100644
> --- a/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/allwinner,sun4i-a10-mmc.yaml
> @@ -56,7 +56,9 @@ properties:
>            - const: allwinner,sun50i-h616-mmc
>            - const: allwinner,sun50i-a100-mmc
>        - items:
> -          - const: allwinner,sun55i-a523-mmc
> +          - enum:
> +              - allwinner,sun55i-a523-mmc
> +              - allwinner,sun60i-a733-mmc
>            - const: allwinner,sun20i-d1-mmc
>
>    reg:
>
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260731-allwinner-a733-mmc-support-c901bc312eef
>
> Best regards,
> --
> Jerome
>

