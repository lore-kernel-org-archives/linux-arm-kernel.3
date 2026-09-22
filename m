Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2177C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 08:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GoG1axqiW7GSzo7JL49Rru+X2FH8bH4THAcHQLUbhIM=; b=yvAuRseQBOZCWv5Y3+gF7Un9CO
	FdKzlvKL/ng+9s++ZYxDNcYcBwHcOC+DqXOWeHEO8Mds3OLtD3Fjxo8vwCu/x95cMo5QZdHh/C1J8
	Js+AHWtnfcpx3Ivt4HS3MfcRUiTg5UUwlgOu7QFndGqPCCpd60o6V4DiGuP6lBTlYq2G1hO+dz7+X
	KjXDABF+/ejRFBJ1CwPMb3ned2IkptQgTxU3hnoxQyZN/BvOj2Wk/Tycbq1/Vwx45pgMPjTBZkzAz
	4CYiJ8lbtMqrKwEaPo7fEGHC9QHGcNthtN+p1PDZHBNgsZdujmSHY7DhS801cZOVN5MHr7GtS0Xjn
	NnIANyog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vfU-00000004dgq-3cNZ;
	Tue, 22 Sep 2026 08:16:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8vfS-00000004dfU-0NEz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 08:15:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M7DNCT3676889
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GoG1axqiW7GSzo7JL49Rru+X
	2FH8bH4THAcHQLUbhIM=; b=TPMh2/ufSQdrKpQI7CtbbyaqenspdgjbOubvvNwH
	nipujmpyFSmceek5gA5NnO594tYTTx5p2eurAErDO+V091J7llTtp6neHQKQyLLG
	/HJ9bl4YUyfaur7FJMJ/50m4C14B0z80NzJ4+Mss9LvSyQv8X6wqTjhSbULOVhJb
	CHSngyP3pZbRj3VNesFN+Sfp1Ub10kXTRJQbiFZGhWQvMdxXrf0CBw4eMPZTHTGD
	SZAg/cO99LRurcCfhnenHVKbO0KCf62/MRLYvR0LQPgtHAy2H+CrHZ+B5ijqKJqh
	wRU2dgcy7mYhaxfBmrlkEU+hdeMfjtUPr920fZe7t2j+DQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu85vk6v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:15:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso520500985a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 01:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790064956; x=1790669756; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GoG1axqiW7GSzo7JL49Rru+X2FH8bH4THAcHQLUbhIM=;
        b=RqvBBmjJRRQsxVQayxPD+ha5HJZ5bwQ7e8Ih6shOI76FO8ReQTWQbgN0a9i48syAyO
         O0MVhuoF+DizSkiNpKVwK0e0Con/w8tuggmlAJfyommP3bDc4KfOW55OrzAHHvHqRuvH
         Iu1UpU6NDztu7NMZZn8vx/8uZySDygNCTEPn9XczmbHZ2mu4qb+KSSSYylNkVaem4Yv8
         rJPVntjkEVjApwJP6a27mRRhUiBs4uFYiybUsUJhLy7otCpnlDoNaayVOq+VYM5dm9Wg
         d5Mi9zT5CKLb4LbdiLJDA6tebA4/oupShPvxohXTP/8bAWjsYt9svsICMzw9HD+THx6s
         CU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790064956; x=1790669756;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GoG1axqiW7GSzo7JL49Rru+X2FH8bH4THAcHQLUbhIM=;
        b=WNPf0N1bNXs1lzf7AL3pzVhc0SRLaLDl0G1w8MLVVJiNOTPIDBeeSCXkN95NwsDFKy
         ntZJDt3GVImv68xGsfprNemnHU3A83UcBlSaRlDeO6EYq2iONSBaPYuLR+cwrB445XEG
         Pa4k5HAkNE6x7GQnbengeqU2LMtNSP9jzgHZhUYy7Nbe38efiYNXyxDbQPNH+ar+canl
         955gDZNngiutmwa9xMqfJjVUykhmsrOdUkphY643/VlGjhI7J6KUiB7wC3+O9J+NzM20
         MD2OJV1roW4ujithLp7ff+zbY0hnSjzvSx4rUupa87Ooktb5UYrb35PJ7u2rQNsiaVGA
         VQIw==
X-Forwarded-Encrypted: i=1; AKwUvBxyWgKWC/0qczAPok4W2IlYYeoZnM/gLsCnR8Z0VkG4wgsj3Rjbe74oLlmkBhQsh3k6WCZ+pQ9lZu85OhIGHWQc@lists.infradead.org
X-Gm-Message-State: AFuF++kFlxTkrHRFFcZjRb1chIoN0U0KxiKybSO/GvsYNtB6/vp0X66C
	iI2OHJnOzTwFpTxZ+YIPZjqAgDDF3EG+7OWwstwnd4VoGXF7XR4dVGSdNZuLIoPjfaQZoqbgI6y
	v18Sem2pfBXjcOSqgFUv2wbBP7k+eOKfNg8thYx4OSlvkqvi8dqAwKJ746sHcf3fjMNLEMFOgq5
	g0IA==
X-Gm-Gg: AYBFou1SmTz8h5AYJSUEE7Phz7B8pw4ZiswnesfSlRhKOGUFcMg1cD76MLXe4akKzMT
	w/264e5tJEmH/8TFFmeNo39LPU5BeL+KvBsyyhg79rXdYQcmlg8y89f6C+mmJQxJMhFKO4p3nFD
	FeUUhpeMpmtRexo0ha+Nj7fHQLfEtZgocULfsqutWVg1n8y11hCcxRxLOq16tJMRmav0Pwnge/2
	R1NqBWRoxYHc+vOODmkdovpnBzbUoLZXfrchBIGErGWr0RR+NfW3ChUxGD/K+2odhTuWPLD+OZb
	BVFOl4Dct6kdYBkYyjeEhKRo5Lpn4z9GT8wQyRwUL2rDzKpvuH5oh5HG73tlS0yEDa+sXRSpwpG
	8e1+d5WNyT+SclA==
X-Received: by 2002:a05:620a:838d:b0:93b:d7a2:dd39 with SMTP id af79cd13be357-93c15ed080cmr404178785a.73.1790064955556;
        Tue, 22 Sep 2026 01:15:55 -0700 (PDT)
X-Received: by 2002:a05:620a:838d:b0:93b:d7a2:dd39 with SMTP id af79cd13be357-93c15ed080cmr404175985a.73.1790064955001;
        Tue, 22 Sep 2026 01:15:55 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a9c5e7850sm45992066b.42.2026.09.22.01.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:15:53 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:15:52 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH net] net: airoha: npu: cancel wdt_work after releasing
 the WDT IRQ
Message-ID: <arI5OD8X2Eoz_Ojd@lore-desk>
References: <20260922000914.542068-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T9inMwS7qgqrO+Sd"
Content-Disposition: inline
In-Reply-To: <20260922000914.542068-1-mhun512@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDExOCBTYWx0ZWRfX+d+pv8dnAVnH
 WZsF+8Pb+4JDV3EMgJ9SFRvhOJv/q+Das3Fjd1Vbk8G6yXLGZ+wjai3oa2GlOYBkm0VQ1CO+0gZ
 meW76vcQpKXfz5Wpmpo7IfPEgUrhdfg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDExOCBTYWx0ZWRfX8fwcJAcWawCw
 XWn5gEw/lBDghkBt/9pYYVXoVQd4pMDyJgUMzYyv852vKYaYfdGj3MpluplHeLxGa8wQTtwwOjv
 riPIj44t97Le6DkZDk4g3kRhV79hOpiS7MGNVdh0WPyEq64WDts2Vk5UKMcgJ0D8jplhqDlBfpc
 EU+mGyH+CBFo2oaV6q2tQhNlhIlCQ23Gy5ymrmX2NwRKFr6DfTEjNdxTxEooP/Dgdt0WgQJxE21
 vKYLF/DxkGwQ7IxVOp608O9clRcMblpI3TaercI1cI3YHu0EQTnd80n/BbMLB6xIw8M8n0vt+N1
 q4E9c0cNPrFLuWQo5MYAnxy80jDA3pd3mUF1uL1TB0znPgGI77lagGjGIk+TQrTUKvDA6SfyqJQ
 17HhGy2KAa8JTuR1N+PcpF5XzARLYvPOxWqKz8APwHRK3xCaZYMfakxLh3+83cnllb64H+10MpC
 jA1la3ZIt607SQAMS2g==
X-Authority-Analysis: v=2.4 cv=E8FYNqdl c=1 sm=1 tr=0 ts=6ab2393c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4MF4sh17vRPpCNt1FVoA:9 a=CjuIK1q_8ugA:10
 a=TFMy8jt120Iq-BnFKmgA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: DjAZIafiY_Q2CUklmDws5fMbeQBx4N1d
X-Proofpoint-GUID: DjAZIafiY_Q2CUklmDws5fMbeQBx4N1d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_011558_132082_17183A8A 
X-CRM114-Status: GOOD (  29.44  )
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

--T9inMwS7qgqrO+Sd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> airoha_npu_remove() calls cancel_work_sync() on each core's wdt_work,
> but the watchdog IRQ that queues it is requested with devm_request_irq()
> and is freed only after .remove() returns.  airoha_npu_wdt_handler() can
> therefore schedule_work() again once the cancel has returned.  struct
> airoha_npu, which contains the work, is devm_kzalloc()'d and is freed in
> that same unwind, so the late work dereferences freed memory.
>=20
> Register the work with devm_work_autocancel() before devm_request_irq()
> and drop .remove().  Devres runs in reverse order, so the IRQ is freed
> before cancel_work_sync(), including when probe fails.  A cancel left in
> .remove() cannot get that order.  Initializing the work first also stops
> a pending watchdog interrupt from queuing an uninitialized work item.
> Probe currently calls INIT_WORK() only after devm_request_irq().
>=20
> This issue was identified during our ongoing static-analysis research
> while reviewing kernel code.
>=20
> Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
> Cc: stable@vger.kernel.org # 6.15+
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

I guess this is net-next material, it is just an optimization, not a real f=
ix.
Anyway:

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  drivers/net/ethernet/airoha/airoha_npu.c | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ether=
net/airoha/airoha_npu.c
> index 5bb4817a898d..4d3195eb00f7 100644
> --- a/drivers/net/ethernet/airoha/airoha_npu.c
> +++ b/drivers/net/ethernet/airoha/airoha_npu.c
> @@ -5,6 +5,7 @@
>   */
> =20
>  #include <linux/devcoredump.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/firmware.h>
>  #include <linux/platform_device.h>
>  #include <linux/of_net.h>
> @@ -751,12 +752,15 @@ static int airoha_npu_probe(struct platform_device =
*pdev)
>  		if (irq < 0)
>  			return irq;
> =20
> +		err =3D devm_work_autocancel(dev, &core->wdt_work,
> +					   airoha_npu_wdt_work);
> +		if (err)
> +			return err;
> +
>  		err =3D devm_request_irq(dev, irq, airoha_npu_wdt_handler,
>  				       IRQF_SHARED, "airoha-npu-wdt", core);
>  		if (err)
>  			return err;
> -
> -		INIT_WORK(&core->wdt_work, airoha_npu_wdt_work);
>  	}
> =20
>  	/* wlan IRQ lines */
> @@ -803,18 +807,8 @@ static int airoha_npu_probe(struct platform_device *=
pdev)
>  	return 0;
>  }
> =20
> -static void airoha_npu_remove(struct platform_device *pdev)
> -{
> -	struct airoha_npu *npu =3D platform_get_drvdata(pdev);
> -	int i;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(npu->cores); i++)
> -		cancel_work_sync(&npu->cores[i].wdt_work);
> -}
> -
>  static struct platform_driver airoha_npu_driver =3D {
>  	.probe =3D airoha_npu_probe,
> -	.remove =3D airoha_npu_remove,
>  	.driver =3D {
>  		.name =3D "airoha-npu",
>  		.of_match_table =3D of_airoha_npu_match,
>=20
> base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
> --=20
> 2.53.0
>=20

--T9inMwS7qgqrO+Sd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarI5OAAKCRA6cBh0uS2t
rI4fAP98jcpyP9Tldx0CU7Z1EVA2UQeRcOvya5TXQ8iPwJToBwD/c4p6RNL7m3/J
s/bHKE3R7bhNQpjQhHDpmb8HLe2IXAQ=
=zZw8
-----END PGP SIGNATURE-----

--T9inMwS7qgqrO+Sd--

