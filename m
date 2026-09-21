Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C4AC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 07:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=naQ4WpZawrXVHKCDJ4sCIHXKOvLcE9EIw/7fiXd4Wo8=; b=oCknJ3RVyKyDhrRYEWDNaIxgIQ
	eAdhFfYURuKxmxcfcOkuWKlE1VzyMoFsIBdNzly2eL1mTjT8Mjb3FDrJdaxEAbenJcbw+YwV7C5Sf
	H8Q2W5Skjh7H1ciUar3inii9K05nyJlumCdMMq5ff+G6wH4MKG9lnYToLAc8fqxR0+0Q7g1KdRgo3
	0kPxHuN/L6NtvI9yLRLHppJlz1rQxNAsv2wt50N+IJhFega4DtFny6PCK4uqOqfg74x1yJKtFc5o0
	cBEtiim38l6oaN8N3JgWYMaTTdst44+F2UKdf6Uo27WMtu78duQ7AzI0EmLtqltg1ZJ0mGNn62fWG
	EmEa2jHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YUB-00000001Djm-2LFa;
	Mon, 21 Sep 2026 07:30:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8YU7-00000001Dft-2m89
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 07:30:46 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7ARAU4013682
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 07:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=naQ4WpZawrXVHKCDJ4sCIHXK
	OvLcE9EIw/7fiXd4Wo8=; b=gap85EuRLe3PHPj1hZRU1CcLcliSgjxrwWeAhSzh
	IYEQ3fdb/kkkSZzRIcOcNbAi3vZboI4PF6aEDhAaW5h1P6KQc4d390jDUKtAmMmt
	/Go6exiFe10u53crVMuNjOtJZKiV34c4Lh/Rja9gBg44sPDAwXr2TVk9LM1NEWz3
	c3cZ+VY60K57dRFKfg9lkXYGy4V8O6gCi4LYdPOtxukI95U7XYuDpd4S6XYMtKXY
	SRTngj9LMbVXk0hCre1BAAcyB0FEc2499W1gayYOeBCPCIJeuhgQzTqGcCsxdwe6
	7c+Rw5/bnUfAL8sgPaiECl0DQTlNn+K48CTbnBqmK3/+WA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs857e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 07:30:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f3426a7cso554535985a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 00:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789975841; x=1790580641; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=naQ4WpZawrXVHKCDJ4sCIHXKOvLcE9EIw/7fiXd4Wo8=;
        b=hLQbMZESG+BE88DTsNTzGTgp3K2lPqqbqi5hLFI8XfPn4kY3u/LmRS+eA8G43CygaY
         jlcMKLuzk15Ik5t06OvXEv5jtWawb/qId63nbBh4NR9uT+Cf2h2mDR5ZpgEe2U3JD469
         WdMg+KbuIXRBcAwSO4QpGoa2dJVjiA3wiurhAJ7Y9fJnfbqCUEN2NolRKZQKHqGaPMez
         7+Udu1fdE0sT4RADp9pZ9mLkXoiYldzlYd92si7g4UkDiPfdonTRwHRyBjcRAOD3rR5T
         nWFCSS1VOt3L6xPWWvGUvB3mbu1PyFVDm/eAL8tayONfk12Y4CKpfZ37w6OLPo718wZ1
         uF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789975841; x=1790580641;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=naQ4WpZawrXVHKCDJ4sCIHXKOvLcE9EIw/7fiXd4Wo8=;
        b=DMXEytt7Fe6CK9Fk+9kgwIl12lbcIPZpu6H2qcL0mJe8+vBJidyFhhkcU/WZU76jw7
         BnZDDp7bbP9uk9KTzC0vUz+ESc0m7saFtjVtr1jLunugbsYd1q86ZnkVxUgSURpksOuD
         29C/ggc9wCwZBAoQMsc6Q26CzDKWEC4QdChF8kptj6BOoq4ySfDh+HVH8TVOrczObvEw
         6el9KfghC7ho2Bib8/PjZVLih6V2OBogCyxjh6hr1na0fW9QuvPhnj8QIxsZCTkkAffK
         1BbXlTv9xQZ0Xp2PToMtFAvgWK3qSmriJ+/LPG1HbYarQHOAKnKRkRqJQYU7EMx9gn+U
         8rDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYntgj/lyldhUmWbGwcC3crv+E24e3XvNSVDjB3tk6gqcrNj20LpNTwzw+bu7yJXGzxb/kdGvLyI6519qlLi5L@lists.infradead.org
X-Gm-Message-State: AFuF++lpjAZsyamnP8ppEluQJyItzsMUDkP594jKVM7Nx67ZxcLQQBsd
	LPlLCqBuiL9isPkg3PjhA7Y25Gley07GKMBSMfMni0OfENwucXugfQaESe8tEaylXm8u8lp6/Y7
	zTNNVQIYLlcv8DddVKzr0miscAdmWnhSCGT5bBZZuhHvyQtztnTXF3RoAwqykNT3koTAvBjPOOY
	A0ag==
X-Gm-Gg: AYBFou0duYiiT2/uoQkXoYh3ZkBeHro81zYxpRMNTjU6ta56V4etbZudFV39aVcPP7u
	deRStjhyxlAb56QQ0iL6akuv9ROxDL9dcYFqbIiT6XAvYh2WZfBi9nYXPcbFBmZFNKGrVBVfFyC
	mQBnt/Ttw19F9lj5Wt6bshciKadIJwsMgHJ0JLAt+CSLYoWkxf1lYXWHjorBgEox5BXkYqjEuVd
	8QXrQDInXQ0aCPk+ltThvZ35xVUuqxQ+eXkVSZxFLAQvWlIZZJY9roJsrwv3dl/QuvQAGoXvRMw
	aGv6h66KpPS646LXYKjpq8vPaizJ3wCVbqkJpwluuoi81/9YcjWZOELxGffNZuHk31pVW3SlSXl
	UF42nqMVMi6n5jA==
X-Received: by 2002:a05:620a:8399:b0:93b:d7a0:d9ed with SMTP id af79cd13be357-93bf57ed145mr819545485a.71.1789975841241;
        Mon, 21 Sep 2026 00:30:41 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:93b:d7a0:d9ed with SMTP id af79cd13be357-93bf57ed145mr819539785a.71.1789975840491;
        Mon, 21 Sep 2026 00:30:40 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc6ca43edsm270154155e9.0.2026.09.21.00.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:30:39 -0700 (PDT)
Date: Mon, 21 Sep 2026 09:30:38 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Til Kaiser <mail@tk154.de>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] net: airoha: Add XDP support
Message-ID: <arDdHp0yZf1BOnL4@lore-desk>
References: <20260920154329.161755-1-mail@tk154.de>
 <20260920154329.161755-2-mail@tk154.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VQT+/dlx0w1fm3WD"
Content-Disposition: inline
In-Reply-To: <20260920154329.161755-2-mail@tk154.de>
X-Proofpoint-ORIG-GUID: 61fOZv4uGoSxbHvdMJStw4-JoOWXz74w
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEwNiBTYWx0ZWRfXxEHF0qqKVIdW
 oM33WHkELZtwXr9AsOrMB/kZy3oBRBHOIBSBvFY+gPO29r1TWU8bkv7OPp4/tf3XtE+YjbYlxIm
 LZby1dFZF9wlOBh04dEx2MYw959YlVE=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6ab0dd22 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=O2EAluRWpG4iOZ8uGDAA:9
 a=CjuIK1q_8ugA:10 a=hZ_VLmqa5PdFaVa1A_8A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEwNiBTYWx0ZWRfX7/26kvu7FeDV
 RIfzUo0cdO+YGK8CGxH32baStNr+XM8nTYsSXBF/Hf91JRYXAHFj7czco5FIwiZbA75KS9xbvDk
 4NJuuX1hygrxMSS0agaLnb2f3uSawTQzUMee4l2bQBOuLEDfgxwt/aS3vGQ6Yq1Xqrfw2s8MvPW
 VD9LH56VTeMsvmPIkBQDekHZEaGwwwuFqLS7DR0a8+m/KGpLPTCj+QeTtbD4LNheLcIMbYR6DGb
 crMj7yl8zmH/4q+Il4amHLdwHRgGQK7AS3uEetos1T1TOymYY4e9ZS5Vhdagg++cI3zgrmdiOTO
 Stn+2ORBf0PsZFF4dk0w/ZzR1k0oFv5Xq3UvK2s3K5MdfbzJ4lKRYbo9xuF+RMj+7Yy1pRsLKkx
 Wp0O0o6qDYNmuO5sHMrqZs1aljdP2DgefJN06WRn5Vt+mGYoebqtXmKiAWWxnX5lIB66pwfe47b
 JqB7FqxycG3kggKJc1Q==
X-Proofpoint-GUID: 61fOZv4uGoSxbHvdMJStw4-JoOWXz74w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_003043_939482_3C4E644C 
X-CRM114-Status: GOOD (  42.00  )
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

--VQT+/dlx0w1fm3WD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Implement eXpress Data Path (XDP) support for the Airoha Ethernet driver.

Hi Til,

thanks to work on it. Some comments inline.

Regards,
Lorenzo

>=20
> XDP programs are attached per net_device via the ndo_bpf hook. The BPF
> program reference is stored as an RCU-protected pointer in struct
> airoha_gdm_dev and replaced atomically on program load/unload via
> rcu_replace_pointer().
>=20
> To support XDP, the following changes are made to the RX path:
>=20
> - The page pool DMA direction is switched from DMA_FROM_DEVICE to
>   DMA_BIDIRECTIONAL, which is required for XDP_TX since the same page
>   can be reused for transmit.
> - The RX headroom is increased from NET_SKB_PAD to XDP_PACKET_HEADROOM
>   so that XDP programs have the required headroom available in the data
>   buffer.
> - RX buffers use a full page rather than a half-page fragment. This leaves
>   sufficient space for XDP headroom, skb_shared_info tailroom, and a
>   standard 1500-byte MTU.
> - AIROHA_RX_MAX_BUF_SIZE expresses the maximum MTU that fits in an RX
>   buffer after headroom, shared-info, Ethernet, VLAN, and FCS overhead.
>   MTU changes are rejected when an XDP program is loaded and the requested
>   MTU would exceed this limit.
> - xdp_rxq_info is registered for each RX queue during initialisation and
>   unregistered on cleanup, with the page pool set as the memory model.
>=20
> The XDP program is run in airoha_run_xdp() for each received buffer.
> The following actions are supported:
>=20
> - XDP_PASS: the buffer is passed to the normal networking stack.
> - XDP_TX: the buffer is transmitted back out the same interface using
>   the new airoha_xdp_xmit_back() helper.
> - XDP_REDIRECT: the buffer is redirected to another interface or map
>   via xdp_do_redirect(), with xdp_do_flush() deferred to the end of
>   the NAPI poll via a per-queue xdp_flush flag.
> - XDP_DROP (and unknown actions): the page is returned to the page pool.
>=20
> Two new TX path helpers are introduced:
>=20
> - airoha_xdp_submit_frame() maps an xdp_frame for DMA (or reuses the
>   page pool DMA address for XDP_TX) and enqueues it into a TX ring,
>   handling multi-buffer frames via skb_shared_info fragments.
> - airoha_xdp_xmit_back() converts an xdp_buff to an xdp_frame and
>   submits it to the TX queue corresponding to the current CPU.
>=20
> The ndo_xdp_xmit handler airoha_xdp_xmit() is also added to allow
> XDP redirect from other drivers into the Airoha interface. Frames are
> submitted using airoha_xdp_submit_frame() with dma_map=3Dtrue.
>=20
> struct airoha_queue_entry is extended with an is_xdpf flag and an
> xdp_frame pointer (in a union with the existing sk_buff pointer) so
> that the TX completion path can correctly free either XDP frames or
> SKBs.
>=20
> The advertised XDP feature flags are set to:
>   NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT | NETDEV_XDP_ACT_NDO_XMIT
>=20
> Signed-off-by: Til Kaiser <mail@tk154.de>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 386 +++++++++++++++++++++--
>  drivers/net/ethernet/airoha/airoha_eth.h |  19 +-
>  2 files changed, 375 insertions(+), 30 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 64619e9a704d..71b25f225a8a 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -13,6 +13,7 @@
>  #include <net/page_pool/helpers.h>
>  #include <net/pkt_cls.h>
>  #include <uapi/linux/ppp_defs.h>
> +#include <linux/bpf_trace.h>

please respect alphabetic order

> =20
>  #include "airoha_regs.h"
>  #include "airoha_eth.h"
> @@ -657,6 +658,255 @@ airoha_qdma_get_gdm_dev(struct airoha_eth *eth, str=
uct airoha_qdma_desc *desc)
>  	return port->devs[d] ? port->devs[d] : ERR_PTR(-ENODEV);
>  }
> =20
> +static void airoha_unmap_xmit_buf(struct airoha_eth *eth,
> +				  struct airoha_queue_entry *e)
> +{
> +	switch (e->dma_type) {
> +	case AIROHA_DMA_MAP_PAGE:
> +		dma_unmap_page(eth->dev, e->dma_addr, e->dma_len,
> +			       DMA_TO_DEVICE);
> +		break;
> +	case AIROHA_DMA_MAP_SINGLE:
> +		dma_unmap_single(eth->dev, e->dma_addr, e->dma_len,
> +				 DMA_TO_DEVICE);
> +		break;
> +	case AIROHA_DMA_UNMAPPED:
> +	default:
> +		break;
> +	}
> +	e->dma_type =3D AIROHA_DMA_UNMAPPED;
> +}
> +
> +static int airoha_xdp_submit_frame(struct airoha_gdm_dev *dev,
> +				   struct xdp_frame *xdpf,
> +				   struct airoha_queue *q,
> +				   int qid, u32 msg0, u32 msg1,
> +				   bool dma_map)

can you please run checkpatch.pl on the patch?

> +{
> +	struct airoha_queue_entry *e, *next_e;
> +	int len =3D xdpf->len, nr_frags, i;
> +	struct airoha_qdma_desc *desc;
> +	struct skb_shared_info *sinfo;
> +	void *data =3D xdpf->data;
> +	u16 index, next_index;
> +	LIST_HEAD(tx_list);
> +	dma_addr_t addr;
> +	u32 val;
> +
> +	sinfo =3D xdp_get_shared_info_from_frame(xdpf);
> +	nr_frags =3D unlikely(xdp_frame_has_frags(xdpf)) ? sinfo->nr_frags : 0;
> +
> +	if (q->queued >=3D q->ndesc - 1 - nr_frags)

nit: I guess it is more readable if you do:

	if (q->queued + 1 + nr_frags >=3D q->ndesc)
		return -EBUSY;

> +		return -EBUSY;
> +
> +	for (i =3D 0; i <=3D nr_frags; i++) {
> +		if (dma_map) {
> +			if (i =3D=3D 0)
> +				addr =3D dma_map_single(dev->eth->dev, data, len,
> +						      DMA_TO_DEVICE);
> +			else
> +				addr =3D dma_map_page(dev->eth->dev, virt_to_page(data),
> +						    offset_in_page(data), len,
> +						    DMA_TO_DEVICE);
> +			if (unlikely(dma_mapping_error(dev->eth->dev, addr)))
> +				goto unmap;
> +		} else {
> +			struct page *page =3D virt_to_head_page(data);
> +
> +			addr =3D page_pool_get_dma_addr(page) +
> +			       (data - (void *)page_address(page));
> +			dma_sync_single_for_device(dev->eth->dev, addr, len,
> +						   DMA_BIDIRECTIONAL);
> +		}
> +
> +		e =3D list_first_entry(&q->tx_list, struct airoha_queue_entry, list);
> +		list_move_tail(&e->list, &tx_list);
> +
> +		index =3D e - q->entry;
> +		desc =3D &q->desc[index];
> +
> +		e->is_xdpf =3D true;
> +		e->xdpf =3D (i =3D=3D nr_frags) ? xdpf : NULL;

nit: you do not need brackets here.

> +		e->dma_addr =3D addr;
> +		e->dma_len =3D len;
> +		if (dma_map)
> +			e->dma_type =3D i =3D=3D 0 ? AIROHA_DMA_MAP_SINGLE : AIROHA_DMA_MAP_P=
AGE;
> +		else
> +			e->dma_type =3D AIROHA_DMA_UNMAPPED;

I thin you can move this chunk in the above if/else block

> +
> +		next_e =3D list_first_entry(&q->tx_list, struct airoha_queue_entry, li=
st);
> +		next_index =3D next_e - q->entry;
> +
> +		val =3D FIELD_PREP(QDMA_DESC_LEN_MASK, len);
> +		if (i < nr_frags)
> +			val |=3D FIELD_PREP(QDMA_DESC_MORE_MASK, 1);
> +		WRITE_ONCE(desc->ctrl, cpu_to_le32(val));
> +		WRITE_ONCE(desc->addr, cpu_to_le32(addr));
> +		val =3D FIELD_PREP(QDMA_DESC_NEXT_ID_MASK, next_index);
> +		WRITE_ONCE(desc->data, cpu_to_le32(val));
> +		WRITE_ONCE(desc->msg0, cpu_to_le32(msg0));
> +		WRITE_ONCE(desc->msg1, cpu_to_le32(msg1));
> +		WRITE_ONCE(desc->msg2, cpu_to_le32(0xffff));
> +
> +		q->queued++;
> +
> +		if (i < nr_frags) {
> +			skb_frag_t *frag =3D &sinfo->frags[i];
> +
> +			data =3D skb_frag_address(frag);
> +			len =3D skb_frag_size(frag);
> +		}
> +	}
> +
> +	return next_index;
> +
> +unmap:
> +	list_for_each_entry(e, &tx_list, list) {
> +		airoha_unmap_xmit_buf(dev->eth, e);
> +		e->is_xdpf =3D false;
> +		e->xdpf =3D NULL;
> +		q->queued--;
> +	}
> +	list_splice(&tx_list, &q->tx_list);
> +
> +	return -ENOMEM;
> +}
> +
> +static int airoha_xdp_xmit_back(struct net_device *netdev, struct xdp_bu=
ff *xdp,
> +				struct airoha_qdma *qdma)
> +{
> +	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> +	struct airoha_queue *q;
> +	struct xdp_frame *xdpf;
> +	u32 msg0, msg1;
> +	int qid, index;
> +	u8 fport;
> +
> +	xdpf =3D xdp_convert_buff_to_frame(xdp);
> +	if (unlikely(!xdpf))
> +		return -EOVERFLOW;
> +
> +	qid =3D airoha_qdma_get_txq(qdma, smp_processor_id());
> +	q =3D &qdma->q_tx[qid];
> +
> +	msg0 =3D FIELD_PREP(QDMA_ETH_TXMSG_CHAN_MASK,
> +			  qid / AIROHA_NUM_QOS_QUEUES) |
> +	       FIELD_PREP(QDMA_ETH_TXMSG_QUEUE_MASK,
> +			  qid % AIROHA_NUM_QOS_QUEUES);
> +
> +	fport =3D airoha_get_fe_port(dev);
> +	msg1 =3D FIELD_PREP(QDMA_ETH_TXMSG_NBOQ_MASK, dev->nbq) |
> +	       FIELD_PREP(QDMA_ETH_TXMSG_FPORT_MASK, fport) |
> +	       FIELD_PREP(QDMA_ETH_TXMSG_METER_MASK, 0x7f);

msg0/msg1 are in common with airoha_xdp_xmit(), right? Can you please move =
them
in airoha_xdp_submit_frame()?

> +
> +	spin_lock(&q->lock);
> +	index =3D airoha_xdp_submit_frame(dev, xdpf, q, qid, msg0, msg1, false);
> +	if (unlikely(index < 0)) {
> +		spin_unlock(&q->lock);
> +		return index;
> +	}
> +
> +	airoha_qdma_rmw(qdma, REG_TX_CPU_IDX(qid),
> +			TX_RING_CPU_IDX_MASK,
> +			FIELD_PREP(TX_RING_CPU_IDX_MASK, index));
> +	spin_unlock(&q->lock);
> +
> +	return 0;
> +}
> +
> +static int airoha_xdp_xmit(struct net_device *netdev, int n,
> +			   struct xdp_frame **frames, u32 flags)
> +{
> +	int qid, index =3D 0, last_index =3D -1, i, drops =3D 0;
> +	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> +	struct airoha_qdma *qdma;
> +	struct airoha_queue *q;
> +	u32 msg0, msg1;
> +	u8 fport;
> +
> +	if (unlikely(flags & ~XDP_XMIT_FLAGS_MASK))
> +		return -EINVAL;
> +
> +	rcu_read_lock();
> +	qdma =3D rcu_dereference(dev->qdma);
> +	if (!qdma) {
> +		rcu_read_unlock();
> +		return -ENODEV;
> +	}
> +
> +	qid =3D airoha_qdma_get_txq(qdma, smp_processor_id());
> +	q =3D &qdma->q_tx[qid];
> +
> +	msg0 =3D FIELD_PREP(QDMA_ETH_TXMSG_CHAN_MASK,
> +			  qid / AIROHA_NUM_QOS_QUEUES) |
> +	       FIELD_PREP(QDMA_ETH_TXMSG_QUEUE_MASK,
> +			  qid % AIROHA_NUM_QOS_QUEUES);
> +
> +	fport =3D airoha_get_fe_port(dev);
> +	msg1 =3D FIELD_PREP(QDMA_ETH_TXMSG_NBOQ_MASK, dev->nbq) |
> +	       FIELD_PREP(QDMA_ETH_TXMSG_FPORT_MASK, fport) |
> +	       FIELD_PREP(QDMA_ETH_TXMSG_METER_MASK, 0x7f);
> +
> +	spin_lock(&q->lock);
> +	for (i =3D 0; i < n; i++) {
> +		index =3D airoha_xdp_submit_frame(dev, frames[i], q, qid, msg0, msg1, =
true);
> +		if (unlikely(index < 0)) {
> +			xdp_return_frame_rx_napi(frames[i]);
> +			drops++;
> +		} else {
> +			last_index =3D index;
> +		}
> +	}
> +	if (n > drops && (flags & XDP_XMIT_FLUSH))

Do you mean to skip it if drops =3D=3D n? If so, I guess it is more readabl=
e to
count number of successful transmissions


> +		airoha_qdma_rmw(qdma, REG_TX_CPU_IDX(qid),
> +				TX_RING_CPU_IDX_MASK,
> +				FIELD_PREP(TX_RING_CPU_IDX_MASK, last_index));
> +	spin_unlock(&q->lock);
> +	rcu_read_unlock();
> +
> +	return n - drops;

same here

> +}
> +
> +static bool airoha_run_xdp(struct net_device *netdev, struct bpf_prog *p=
rog,
> +			   struct xdp_buff *xdp, struct airoha_queue *q,
> +			   struct airoha_queue_entry *e, struct page *page)
> +{
> +	u32 act =3D bpf_prog_run_xdp(prog, xdp);
> +
> +	switch (act) {
> +	case XDP_PASS:
> +		return false;
> +	case XDP_TX:
> +		if (unlikely(airoha_xdp_xmit_back(netdev, xdp, q->qdma) < 0)) {
> +			trace_xdp_exception(netdev, prog, act);
> +			page_pool_put_full_page(q->page_pool, page, true);
> +		} else {
> +			e->buf =3D NULL;
> +		}
> +		break;
> +	case XDP_REDIRECT:
> +		if (unlikely(xdp_do_redirect(netdev, xdp, prog) < 0)) {
> +			trace_xdp_exception(netdev, prog, act);
> +			page_pool_put_full_page(q->page_pool, page, true);
> +		} else {
> +			q->xdp_flush =3D true;
> +			e->buf =3D NULL;
> +		}
> +		break;
> +	default:
> +		bpf_warn_invalid_xdp_action(netdev, prog, act);
> +		fallthrough;
> +	case XDP_ABORTED:
> +		trace_xdp_exception(netdev, prog, act);
> +		fallthrough;
> +	case XDP_DROP:
> +		page_pool_put_full_page(q->page_pool, page, true);
> +		break;
> +	}
> +
> +	return true;
> +}
> +
>  static int airoha_qdma_rx_process(struct airoha_queue *q, int budget)
>  {
>  	enum dma_data_direction dir =3D page_pool_get_dma_dir(q->page_pool);
> @@ -698,6 +948,27 @@ static int airoha_qdma_rx_process(struct airoha_queu=
e *q, int budget)
> =20
>  		netdev =3D netdev_from_priv(dev);
>  		if (!q->skb) { /* first buffer */
> +			struct bpf_prog *xdp_prog;

nit: prog seems better to me

> +
> +			rcu_read_lock();
> +			xdp_prog =3D rcu_dereference(dev->xdp_prog);
> +			if (xdp_prog) {
> +				struct xdp_buff xdp;
> +
> +				xdp_init_buff(&xdp, q->buf_size, &q->xdp_rxq);
> +				xdp_prepare_buff(&xdp, e->buf - AIROHA_RX_HEADROOM,
> +						 AIROHA_RX_HEADROOM, len, false);
> +
> +				if (airoha_run_xdp(netdev, xdp_prog, &xdp, q, e, page)) {
> +					rcu_read_unlock();
> +					continue;
> +				}
> +
> +				len =3D xdp.data_end - xdp.data;
> +				e->buf =3D xdp.data;
> +			}
> +			rcu_read_unlock();
> +
>  			q->skb =3D napi_build_skb(e->buf - AIROHA_RX_HEADROOM,
>  						q->buf_size);
>  			if (!q->skb)
> @@ -779,6 +1050,11 @@ static int airoha_qdma_rx_napi_poll(struct napi_str=
uct *napi, int budget)
>  		done +=3D cur;
>  	} while (cur && done < budget);
> =20
> +	if (q->xdp_flush) {
> +		xdp_do_flush();
> +		q->xdp_flush =3D false;
> +	}
> +
>  	if (done < budget && napi_complete(napi)) {
>  		struct airoha_qdma *qdma =3D q->qdma;
>  		int i, qid =3D q - &qdma->q_rx[0];
> @@ -804,17 +1080,17 @@ static int airoha_qdma_init_rx_queue(struct airoha=
_queue *q,
>  		.order =3D 0,
>  		.pool_size =3D 256,
>  		.flags =3D PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
> -		.dma_dir =3D DMA_FROM_DEVICE,
> +		.dma_dir =3D DMA_BIDIRECTIONAL,
>  		.max_len =3D PAGE_SIZE,
>  		.nid =3D NUMA_NO_NODE,
>  		.dev =3D qdma->eth->dev,
>  		.napi =3D &q->napi,
>  	};
> +	int qid =3D q - &qdma->q_rx[0], thr, err;
>  	struct airoha_eth *eth =3D qdma->eth;
> -	int qid =3D q - &qdma->q_rx[0], thr;
>  	dma_addr_t dma_addr;
> =20
> -	q->buf_size =3D PAGE_SIZE / 2;
> +	q->buf_size =3D PAGE_SIZE;

I guess this can introduce a performance penalty in the non-xdp case since =
now
we need a full page for a single buffer while in the current codebase we can
have 2 fragments in a single page. Moreover, it seems to me you are not usi=
ng
latest codebase here.

>  	q->qdma =3D qdma;
> =20
>  	q->entry =3D devm_kzalloc(eth->dev, ndesc * sizeof(*q->entry),
> @@ -829,15 +1105,22 @@ static int airoha_qdma_init_rx_queue(struct airoha=
_queue *q,
> =20
>  	q->page_pool =3D page_pool_create(&pp_params);
>  	if (IS_ERR(q->page_pool)) {
> -		int err =3D PTR_ERR(q->page_pool);
> -
> -		q->page_pool =3D NULL;
> -		return err;
> +		err =3D PTR_ERR(q->page_pool);
> +		goto err_page_pool_create;
>  	}
> =20
>  	q->ndesc =3D ndesc;
>  	netif_napi_add(eth->napi_dev, &q->napi, airoha_qdma_rx_napi_poll);
> =20
> +	err =3D xdp_rxq_info_reg(&q->xdp_rxq, eth->napi_dev, qid, q->napi.napi_=
id);
> +	if (err)
> +		goto err_xdp_rxq_info_reg;
> +
> +	err =3D xdp_rxq_info_reg_mem_model(&q->xdp_rxq, MEM_TYPE_PAGE_POOL,
> +					 q->page_pool);
> +	if (err)
> +		goto err_xdp_rxq_info_reg_mem_model;
> +
>  	airoha_qdma_wr(qdma, REG_RX_RING_BASE(qid), dma_addr);
>  	airoha_qdma_rmw(qdma, REG_RX_RING_SIZE(qid),
>  			RX_RING_SIZE_MASK,
> @@ -853,6 +1136,14 @@ static int airoha_qdma_init_rx_queue(struct airoha_=
queue *q,
>  	airoha_qdma_fill_rx_queue(q);
> =20
>  	return 0;
> +
> +err_xdp_rxq_info_reg_mem_model:
> +	xdp_rxq_info_unreg(&q->xdp_rxq);
> +err_xdp_rxq_info_reg:
> +	page_pool_destroy(q->page_pool);
> +err_page_pool_create:
> +	q->page_pool =3D NULL;
> +	return err;
>  }
> =20
>  static void airoha_qdma_cleanup_rx_queue(struct airoha_queue *q)
> @@ -882,6 +1173,9 @@ static void airoha_qdma_cleanup_rx_queue(struct airo=
ha_queue *q)
>  		q->queued--;
>  	}
> =20
> +	if (xdp_rxq_info_is_reg(&q->xdp_rxq))
> +		xdp_rxq_info_unreg(&q->xdp_rxq);
> +
>  	q->head =3D q->tail;
>  	/* Set RX_DMA_IDX to RX_CPU_IDX to notify the hw the QDMA RX ring is
>  	 * empty.
> @@ -949,25 +1243,6 @@ static void airoha_qdma_wake_netdev_txqs(struct air=
oha_queue *q)
>  	q->txq_stopped =3D false;
>  }
> =20
> -static void airoha_unmap_xmit_buf(struct airoha_eth *eth,
> -				  struct airoha_queue_entry *e)
> -{
> -	switch (e->dma_type) {
> -	case AIROHA_DMA_MAP_PAGE:
> -		dma_unmap_page(eth->dev, e->dma_addr, e->dma_len,
> -			       DMA_TO_DEVICE);
> -		break;
> -	case AIROHA_DMA_MAP_SINGLE:
> -		dma_unmap_single(eth->dev, e->dma_addr, e->dma_len,
> -				 DMA_TO_DEVICE);
> -		break;
> -	case AIROHA_DMA_UNMAPPED:
> -	default:
> -		break;
> -	}
> -	e->dma_type =3D AIROHA_DMA_UNMAPPED;
> -}
> -
>  static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget)
>  {
>  	struct airoha_tx_irq_queue *irq_q;
> @@ -1037,7 +1312,12 @@ static int airoha_qdma_tx_napi_poll(struct napi_st=
ruct *napi, int budget)
>  		WRITE_ONCE(desc->msg1, 0);
>  		q->queued--;
> =20
> -		if (skb) {
> +		if (e->is_xdpf) {
> +			if (e->xdpf)
> +				xdp_return_frame(e->xdpf);
> +			e->is_xdpf =3D false;
> +			e->xdpf =3D NULL;
> +		} else if (e->skb) {
>  			struct airoha_gdm_dev *dev =3D netdev_priv(skb->dev);
>  			u16 qidx =3D skb_get_queue_mapping(skb);
>  			struct netdev_queue *txq;
> @@ -1218,7 +1498,12 @@ static void airoha_qdma_tx_cleanup(struct airoha_q=
dma *qdma)
>  			WRITE_ONCE(desc->msg1, 0);
>  			WRITE_ONCE(desc->msg2, 0);
> =20
> -			if (skb) {
> +			if (e->is_xdpf) {
> +				if (e->xdpf)
> +					xdp_return_frame(e->xdpf);
> +				e->is_xdpf =3D false;
> +				e->xdpf =3D NULL;
> +			} else if (skb) {
>  				struct netdev_queue *txq;
> =20
>  				txq =3D skb_get_tx_queue(skb->dev, skb);
> @@ -2201,6 +2486,12 @@ static int airoha_dev_change_mtu(struct net_device=
 *netdev, int mtu)
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
>  	struct airoha_gdm_port *port =3D dev->port;
> =20
> +	if (rcu_access_pointer(dev->xdp_prog) && mtu > AIROHA_RX_MAX_BUF_SIZE) {
> +		netdev_err(netdev, "MTU too large for XDP (max %lu)\n",
> +			   AIROHA_RX_MAX_BUF_SIZE);
> +		return -EINVAL;
> +	}
> +
>  	WRITE_ONCE(netdev->mtu, mtu);
>  	if (port->users)
>  		airoha_dev_set_xmit_frame_size(netdev);
> @@ -2377,6 +2668,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
> =20
>  		list_move_tail(&e->list, &tx_list);
>  		e->skb =3D i =3D=3D nr_frags - 1 ? skb : NULL;
> +		e->is_xdpf =3D false;
>  		e->dma_addr =3D addr;
>  		e->dma_len =3D len;
> =20
> @@ -3321,6 +3613,39 @@ static int airoha_tc_setup_qdisc_htb(struct net_de=
vice *netdev,
>  	return 0;
>  }
> =20
> +static int airoha_xdp_setup(struct net_device *netdev, struct bpf_prog *=
prog,
> +			    struct netlink_ext_ack *extack)
> +{
> +	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> +	struct bpf_prog *old_prog;
> +
> +	if (netdev->features & NETIF_F_LRO) {
> +		NL_SET_ERR_MSG_MOD(extack, "XDP is not supported with LRO");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	if (netdev->mtu > AIROHA_RX_MAX_BUF_SIZE) {
> +		NL_SET_ERR_MSG_MOD(extack, "MTU too large for XDP");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	old_prog =3D rcu_replace_pointer(dev->xdp_prog, prog, lockdep_rtnl_is_h=
eld());
> +	if (old_prog)
> +		bpf_prog_put(old_prog);
> +
> +	return 0;
> +}
> +
> +static int airoha_xdp_bpf(struct net_device *netdev, struct netdev_bpf *=
xdp)

nit: airoha_dev_bpf()?

> +{
> +	switch (xdp->command) {
> +	case XDP_SETUP_PROG:
> +		return airoha_xdp_setup(netdev, xdp->prog, xdp->extack);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static int airoha_dev_tc_setup(struct net_device *dev,
>  			       enum tc_setup_type type, void *type_data)
>  {
> @@ -3347,6 +3672,8 @@ static const struct net_device_ops airoha_netdev_op=
s =3D {
>  	.ndo_get_stats64        =3D airoha_dev_get_stats64,
>  	.ndo_set_mac_address	=3D airoha_dev_set_macaddr,
>  	.ndo_setup_tc		=3D airoha_dev_tc_setup,
> +	.ndo_bpf		=3D airoha_xdp_bpf,
> +	.ndo_xdp_xmit		=3D airoha_xdp_xmit,
>  };
> =20
>  static const struct ethtool_ops airoha_ethtool_ops =3D {
> @@ -3435,6 +3762,9 @@ static int airoha_alloc_gdm_device(struct airoha_et=
h *eth,
>  			      NETIF_F_HW_TC;
>  	netdev->features |=3D netdev->hw_features;
>  	netdev->vlan_features =3D netdev->hw_features;
> +	netdev->xdp_features =3D NETDEV_XDP_ACT_BASIC |
> +				NETDEV_XDP_ACT_REDIRECT |
> +				NETDEV_XDP_ACT_NDO_XMIT;

please align it:

	netdev->xdp_features =3D NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
			       NETDEV_XDP_ACT_NDO_XMIT;

>  	SET_NETDEV_DEV(netdev, eth->dev);
> =20
>  	/* reserve hw queues for HTB offloading */
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 8277c1c87bb3..cfbc0b8f5bf9 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -7,6 +7,7 @@
>  #ifndef AIROHA_ETH_H
>  #define AIROHA_ETH_H
> =20
> +#include <linux/bpf.h>
>  #include <linux/debugfs.h>
>  #include <linux/etherdevice.h>
>  #include <linux/iopoll.h>
> @@ -15,6 +16,7 @@
>  #include <linux/reset.h>
>  #include <linux/soc/airoha/airoha_offload.h>
>  #include <net/dsa.h>
> +#include <net/xdp.h>
> =20
>  #define AIROHA_MAX_NUM_GDM_PORTS	4
>  #define AIROHA_MAX_NUM_GDM_DEVS		2
> @@ -34,7 +36,11 @@
>  #define AIROHA_FE_MC_MAX_VLAN_TABLE	64
>  #define AIROHA_FE_MC_MAX_VLAN_PORT	16
>  #define AIROHA_NUM_TX_IRQ		2
> -#define AIROHA_RX_HEADROOM		(NET_SKB_PAD + NET_IP_ALIGN)
> +#define AIROHA_RX_HEADROOM		(XDP_PACKET_HEADROOM + NET_IP_ALIGN)
> +#define AIROHA_RX_PAD			(AIROHA_RX_HEADROOM + \
> +					 SKB_DATA_ALIGN(sizeof(struct skb_shared_info)))
> +#define AIROHA_RX_MAX_BUF_SIZE		(PAGE_SIZE - AIROHA_RX_PAD - \
> +					 VLAN_ETH_HLEN - ETH_FCS_LEN)

same as above, I think this can introduce a performance penalty in the non-=
xdp
case. Can you please check? (e.g. on a 10Gbps link).

>  #define AIROHA_RX_LEN(_n)		((_n) - AIROHA_RX_HEADROOM)
>  #define HW_DSCP_NUM			2048
>  #define IRQ_QUEUE_LEN(_n)		((_n) ? 1024 : 2048)
> @@ -182,12 +188,16 @@ struct airoha_queue_entry {
>  		void *buf;
>  		struct {
>  			struct list_head list;
> -			struct sk_buff *skb;
> +			union {
> +				struct sk_buff *skb;
> +				struct xdp_frame *xdpf;
> +			};
>  			enum airoha_dma_map_type dma_type;
>  		};
>  	};
>  	dma_addr_t dma_addr;
>  	u16 dma_len;
> +	bool is_xdpf;
>  };
> =20
>  struct airoha_queue {
> @@ -211,6 +221,9 @@ struct airoha_queue {
>  	struct page_pool *page_pool;
>  	struct sk_buff *skb;
> =20
> +	struct xdp_rxq_info xdp_rxq;
> +	bool xdp_flush;
> +
>  	struct list_head tx_list;
>  };
> =20
> @@ -589,6 +602,8 @@ struct airoha_gdm_dev {
>  	unsigned long flags;
>  	int nbq;
> =20
> +	struct bpf_prog __rcu *xdp_prog;

nit: prog

> +
>  	struct airoha_hw_stats stats;
> =20
>  	/* Serialize netdev_tx_completed_queue() calls per TX queue during
> --=20
> 2.55.0
>=20
>=20

--VQT+/dlx0w1fm3WD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarDdHgAKCRA6cBh0uS2t
rAf1AQD8IkDHYN0qvtqEXR3XZDwyHPV6LyPfwsuckfKWmwV/SQD/SvqqXWhvn7do
0mynLIH3KJ4wU2opApbHpoz5rPbJqgg=
=4ysZ
-----END PGP SIGNATURE-----

--VQT+/dlx0w1fm3WD--

