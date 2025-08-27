Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235E3CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=af/p3RaP/vSahE1FXHlsLYbW2oFoctkUwNzanHkCnaQ=; b=gzvVOXnFzrLdb4sXkDJEPWBXJ8
	EumS5mWzTC/eAaZe6CHV0vG/oCCZNZbaSeDUGsvV70hcc5balImA+l90vs7iWj2GufB8bu4I1qGzN
	aTpl+qK7ZrZcNgNSMz8J+tP4dvplMM9j6f5bacsycXT0eyPBcW9BIYv8w+qaVhzOC2+ybUUiwpfA0
	phsBVaOwzqpnO2Llspf/JDNYilNBBXWOFkLh0UQGx1vfNJ1d6GWN+Uj3HQvAPIK8LRGGfCuKf5wvN
	VgDg9H13KMaeEjvDy0WfBjZx2MWdF19sQAabqUlZ1aLPN6MO7K2VrzOl22cX6pmNbcc3H5d/nVFms
	h5rz9eyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEjZ-0000000FLfd-0Wm3;
	Wed, 27 Aug 2025 11:54:33 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174] helo=mx0b-0016f401.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDqv-0000000F8LO-36Se
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:58:07 +0000
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QNKQXI014951;
	Wed, 27 Aug 2025 03:57:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pfpt0220; bh=af/p3RaP/vSahE1FXHlsLYbW2
	oFoctkUwNzanHkCnaQ=; b=cBQYT/CT/4rzegZX9P3W0dfI+1/GqxMNjoGEymUbx
	HufBeIzlllwV8um4eLQwyePm8TtYlk8SxzjJoggJ3vW+2hn/yMPZcrDqZ+xN4bLG
	ZRNjkpdJMpaY+MQnDxNxUwsgn2CcWbEPNpFZFM+/aa5g3x4TErmZpNTQI6IpxhwD
	BvzaekgBa3NuacPNYv4ELwBg30VzBh1gMlx+jatdM6HqaLISMq8JPJd0/SxYIpsU
	7Q0dr3OQbm22cjJ+P2GhYotrNJI7TGKGL5LeYgoIVKyYjmy5WjdeICw72xQuLty+
	r0RsAB7Aa85zQ+0cPpZLNdx53Px6cItQ1lwFfzAKvE64g==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 48spgv98x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 03:57:54 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 27 Aug 2025 03:57:58 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Wed, 27 Aug 2025 03:57:58 -0700
Received: from opensource (unknown [10.29.8.22])
	by maili.marvell.com (Postfix) with SMTP id AF2B33F706B;
	Wed, 27 Aug 2025 03:57:50 -0700 (PDT)
Date: Wed, 27 Aug 2025 10:57:49 +0000
From: Subbaraya Sundeep <sbhatta@marvell.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>
CC: Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "moderated
 list:ARM/CAVIUM THUNDER NETWORK DRIVER"
	<linux-arm-kernel@lists.infradead.org>,
        "open list:NETWORKING DRIVERS"
	<netdev@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] net: thunderx: Remove redundant ternary operators
Message-ID: <aK7krVpLMXzt_xWU@opensource>
References: <20250827101607.444580-1-liaoyuanhong@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250827101607.444580-1-liaoyuanhong@vivo.com>
X-Authority-Analysis: v=2.4 cv=E5bNpbdl c=1 sm=1 tr=0 ts=68aee4b2 cx=c_pps a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=1WtWmnkvAAAA:8 a=30FXI7qiAAAA:8 a=ExQkp8-qdG5FzR3rXfMA:9 a=CjuIK1q_8ugA:10
 a=Z3-ukm4F-8FzIVecr7dh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDIwNSBTYWx0ZWRfX515N0BPggWRr hZO3IPq5ipoQoZvK1sYw8Tpf1nMeViWlaO8kgK6M4M4WtfHkiXn276c9P5vSgjQyCtuMSXgbLdt q5R+1vSL6sGg5kYp7K5NVfx8EL+FxJw3ucCGCkZqYqnTPGkK+pkJh4VDZC3i92lhnRI/kGUgBhN
 6ZVzmgcVVobEGgBH4Mf1FZb/D7PolD1F/YAgzNE9vNVvcKycQpLXTlR4iwwty1L5OAKDDSsqLA6 Hnr8OJAczgSHXeFl7K85yOpU4x6LsTsgiXg/48vFSabWahLNwgiVC70EiOOI+tq3GMvwFbCt085 129URzg3v32OOJl+31KLAluSkCpZ7KoVx4CjdnyGx33RxwGXFQoWPngKo1h5hiYbpUf6/uD252e D4PjRqxb
X-Proofpoint-GUID: -rKVUCWCR-3T-Za0PehwUcB6Xq9hxD5w
X-Proofpoint-ORIG-GUID: -rKVUCWCR-3T-Za0PehwUcB6Xq9hxD5w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_035805_963128_C0BC9C10 
X-CRM114-Status: GOOD (  18.32  )
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

On 2025-08-27 at 10:16:07, Liao Yuanhong (liaoyuanhong@vivo.com) wrote:
> For ternary operators in the form of "a ? true : false", if 'a' itself
> returns a boolean result, the ternary operator can be omitted. Remove
> redundant ternary operators to clean up the code.
> 
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
Reviewed-by: Subbaraya Sundeep <sbhatta@marell.com>

Looks good to me but a minor comment - include net-next in the subject
Thanks,
Sundeep

> ---
>  drivers/net/ethernet/cavium/thunder/nic_main.c    | 2 +-
>  drivers/net/ethernet/cavium/thunder/thunder_bgx.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/cavium/thunder/nic_main.c b/drivers/net/ethernet/cavium/thunder/nic_main.c
> index 0ec65ec634df..b7cf4ba89b7c 100644
> --- a/drivers/net/ethernet/cavium/thunder/nic_main.c
> +++ b/drivers/net/ethernet/cavium/thunder/nic_main.c
> @@ -174,7 +174,7 @@ static void nic_mbx_send_ready(struct nicpf *nic, int vf)
>  		if (mac)
>  			ether_addr_copy((u8 *)&mbx.nic_cfg.mac_addr, mac);
>  	}
> -	mbx.nic_cfg.sqs_mode = (vf >= nic->num_vf_en) ? true : false;
> +	mbx.nic_cfg.sqs_mode = vf >= nic->num_vf_en;
>  	mbx.nic_cfg.node_id = nic->node;
>  
>  	mbx.nic_cfg.loopback_supported = vf < nic->num_vf_en;
> diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
> index 21495b5dce25..10d501ee7b32 100644
> --- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
> +++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
> @@ -959,7 +959,7 @@ static void bgx_poll_for_sgmii_link(struct lmac *lmac)
>  		goto next_poll;
>  	}
>  
> -	lmac->link_up = ((pcs_link & PCS_MRX_STATUS_LINK) != 0) ? true : false;
> +	lmac->link_up = (pcs_link & PCS_MRX_STATUS_LINK) != 0;
>  	an_result = bgx_reg_read(lmac->bgx, lmac->lmacid,
>  				 BGX_GMP_PCS_ANX_AN_RESULTS);
>  
> -- 
> 2.34.1
> 

