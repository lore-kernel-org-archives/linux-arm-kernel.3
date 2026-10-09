Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AA5CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgcRvQ8TaWMkNOqOe2pfYdXqLm8BXmdUD+Z1gEAZJbs=; b=yLOLKTVG6Jn4Xe46xRg1BjmzLp
	qKBr7lbuEwQAiyj+4HKXo1J05Vs7fjqTeakRQPWml/1BAGhucOAzMtREE5Lr0jfSV/4XZihQQFyWq
	EDfokWSzRLQYiOxh5BkwQJ189bLo+ANkZtwjl7721UurDWqQqpo6lPE2hxLwHFBqDr/uY2+zqzJcJ
	RtXlNgQdcxg6o2HUrH5fvcV104Dpp1gQ47yewMNt82YzSgC6F1BWwec6ZIYbY1KfICYcUwibP787+
	rhikcR8V52aBIl4z6dO12MXVpNX8YHXdQLL6es8F0b8kZIt8SdhnV010tBcJRzUEyTPSe/5WEHveF
	91jJB/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7rl-000000064AM-3JDX;
	Fri, 09 Oct 2026 10:30:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7rj-0000000649k-0j09
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 10:30:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KOVR3977823
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 10:30:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NgcRvQ8TaWMkNOqOe2pfYdXq
	Lm8BXmdUD+Z1gEAZJbs=; b=a7AUX2togmSo52xyBK+4RlrWQzV2B2+VWqeCb6Gi
	FWz3p69gFWF2psgrpUKCzkand4b9LRPtXvDHUHsyFMVW+2zecGgsDBnaPG+D9a53
	VjHvkFaJfQFJzBh7bju+56GWvTsmn1LvxzSzN+u09OHaFM+c0YnspQvgs9iCM5Wn
	kHW38v06aVaCg6N1hKt3fdy49q6VH7372T222fge3lm8KbWO95k0PDSgsKTnvInB
	GNnT0CzzIAuPJtwO+HQoyXGxUujyek3AdZOAQhivjVPtixaVzbcjvXjBlHGhnVnu
	PKLNoETNARzr96ChMO+hWJByR6N6bk+Wj9OXNvWQvcphJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6ev5bd02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 10:30:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so1326010485a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 03:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791541814; x=1792146614; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NgcRvQ8TaWMkNOqOe2pfYdXqLm8BXmdUD+Z1gEAZJbs=;
        b=LZBLJhliCMsatUvkWTXzvTv2PiMZMGAKYdbEymrGhLiRSL7PUigejAceU6oziKkRkj
         /rXGTQEYH9u9K44ILNoacfBpEfRL04qyzMmcP6XS2SszRx91UfC+7S9ouQVVvTnW4WEP
         0tKQ1AbsSLSFx7KpIfDPrgOs0ilAw0069mkQBE3Urmx71+HheD4q0bnhoKobigoEOBVq
         rmI2MH4s0Zln3lMbCd4DKJf7y7GZYDbv64P7U6GZGPIAYArcSF7gmxscJz+NQYF7iBBE
         3GdJC1j5hwpCncfOnaEydygXl94nb3yPi5Gv1CiC6Ebs1+Saz7aE/Y2HYEJsXdErFYhx
         vUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541814; x=1792146614;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgcRvQ8TaWMkNOqOe2pfYdXqLm8BXmdUD+Z1gEAZJbs=;
        b=cBvfCn2Wq+DHcn+MTnzY61i08Pzk1nSaisu32I99SYmmsNGi8h2CIJc9osYFzpLpmP
         sFlie0JWyrgSNfrpqj4fzMFod37oM+K5IiseAYD/+QRpyjkFZ4FJMprfFNHVK8OTgdpM
         eHseolbC6hYxex8cc0vhMFkCyYvbfojBa9fxDIPWGI2T5soBhJ48foP03xfHMV2sEQe9
         +SmsEBnByB6xukK6zIur1EXtGYMDZCIFVhivfEgwY6kVBAfplHWcIPKM8qyNn7P5TAzi
         ZJTUxiWDbj8glBsEob4NVCZhI5MDph2R6r3GYFQEQQ8oQQbupHrx9t9HzoQZuZhlmlgy
         h9ew==
X-Forwarded-Encrypted: i=1; AKwUvByiL50UWepO2q7BZGOTKWQl3sFtRXlFCUou6k0Jme9j8StRbbUE7AqX7ZU4j+wAvNf/Mir4ulPldsf0EdapwEiP@lists.infradead.org
X-Gm-Message-State: AFuF++kWxKmfvI709aZNlBquS93dMXTCPiJqUaIacunYizvl6eREiiYk
	Lk5xrhrbkopLmq3cSzXzdgh8DTmIwN9smIqWZ9PeOhGZm4g3yPkM6cwtF8fyDCcFT+MZYqNbfeT
	2vVTlIUzSEIkl1WVJ1Won05uVF3vFs6zi0CMHSfQL+/IhKdrci2k3avyrPEmSlwC/0bJuxQcHs8
	t9Bw==
X-Gm-Gg: AYBFou33W164KM9vd/GUKHg8NQYMlZqVpOjnCXCkNJbu+TxmIVvLznjGpwTSxmd514F
	zI2bRBHM+zcoX/cLzp+/yb2qmsHxyaa7+X6spN8fJtTf5bs5jfk0eKtgNB9cgqgFdtKRQkqT0nQ
	8XBH9/E2nWko3w0Cbrb6TLe7QUyINRRiuNHKTfFQbP/mQNhW2JCNBMWdyx631dwlVTgKfagfCdK
	myt8NcVw6WV10nV8nqB7ZPfRQlESjs5aCDtZFZewzLGxcT2HJ07+hxTzUiexVYI/nCjERKhxw50
	daZFOCQnljngvoOi5T0ivEm56guinja9MnJ3CSm6E8Z/CIJS8B7IL1oiSNip1OaqafbBfT3bv1E
	dKw0W5KHMrtqr5g==
X-Received: by 2002:a05:620a:8905:b0:93b:d7a3:45d7 with SMTP id af79cd13be357-93ebd2ab621mr200230785a.64.1791541813344;
        Fri, 09 Oct 2026 03:30:13 -0700 (PDT)
X-Received: by 2002:a05:620a:8905:b0:93b:d7a3:45d7 with SMTP id af79cd13be357-93ebd2ab621mr200224085a.64.1791541812787;
        Fri, 09 Oct 2026 03:30:12 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm71173225e9.2.2026.10.09.03.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:30:10 -0700 (PDT)
Date: Fri, 9 Oct 2026 12:30:10 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [PATCH net-next v4 0/2] net: stmmac: introduce XDP rx multi-buff
 support
Message-ID: <asjCMltF_qO8-mIv@lore-desk>
References: <20261006-stmmac-rx-mb-v4-0-efa4ca974e3d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wgndA7NxLnWRH+t1"
Content-Disposition: inline
In-Reply-To: <20261006-stmmac-rx-mb-v4-0-efa4ca974e3d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX5dy1jcrNzr0d
 LDekIFgaY59yQ2SgapCRffflZGYtc6k1A7EINIhf/Kfg9I+r/GgdTY/Vsr6jd7Fwtsyb6S2jwdy
 xiVk59UGttbRlvtHS2+S6/yHtuKGHxk=
X-Authority-Analysis: v=2.4 cv=MMT1C8Zl c=1 sm=1 tr=0 ts=6ac8c236 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=w_4PuGcMj9oXbp2957IA:9 a=CjuIK1q_8ugA:10
 a=iAawtVTI3XspOHW-ZK8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ehL33Uy7WJNYm_bmK86MeMYz9b5ktS4U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX635HgeiT86Qa
 BztFp+tnv7NSaK825k2DvlznxC90nzP83emoq74KHa2RQ58e1SKqhts+l6qOeLYuyZJ6kra7t4s
 nc8cbSnZ9vhMkL0XS67pkszOaoUUhyiZVol6/Ej5Ogz2vpUesf2mc5/xSmGpsy0oXbcQwBJFMM+
 YbLy1FneGfy4STLCsR+J6DFnICtxDPDBjYeiDgtjlPwsBA6DhKc6vrCvTfccnP82K1K8xyYRf64
 GhTVKaIIMdUNjnu/Jfa1l1l8EBdMbNrFNtGHhONzEdcsKSizSpGmgKNs5QUc38MIp51EUwMiTb7
 Toj18f0B1NxLJBeuQ/aAo/rlvRa3CceCu38Sliw33jxZ6IL6nu83OMfzyccyppBZQEJuHtgOSrR
 iki7jCLYdMnbQHBDvlMOm0xeJCj3RvyJcYwE15ayTEtJNVU9wwEOHitiPG0buj6YfyW+8Fedwnf
 83Lb+HG3f9e+sccUvjw==
X-Proofpoint-ORIG-GUID: ehL33Uy7WJNYm_bmK86MeMYz9b5ktS4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_033015_222970_AB5AE838 
X-CRM114-Status: GOOD (  22.48  )
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

--wgndA7NxLnWRH+t1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Rework stmmac_rx() to build the xdp_buff from all the descriptors that ma=
ke
> up a frame, so the XDP program runs on the whole (possibly fragmented)
> packet instead of the first buffer only. Fix possible rx_q state leaks
> when closing/opening the interface.
>=20
> Note that an XDP program still cannot be attached with an MTU larger than
> ETH_DATA_LEN and SPH is disabled while XDP is enabled, so an ordinary
> frame fits in a single buffer. The multi-buffer path is exercised by
> frames that do span several descriptors (for example jumbo frames the MAC
> admits through its jumbo-enable bit) and is groundwork for extending XDP
> to jumbo/SPH; it does not enable XDP jumbo support by itself.

I will fix issues reported by sashiko in v5.

Regards,
Lorenzo

>=20
> ---
> Changes in v4:
> - Reset in_progress flag when the packet is fully consumed.
> - Advetise NETDEV_XDP_ACT_RX_SG capability.
> - Link to v3: https://lore.kernel.org/r/20261004-stmmac-rx-mb-v3-0-50fa17=
1af9ec@oss.qualcomm.com
>=20
> Changes in v3:
> - Return secondary page in case of error.
> - Introduce stmmac_xdp_shrink_tail() to remove the ethernet FCS.
> - Add patch 'net: stmmac: take ownership of saved RX state at poll
>   entry' from James.
> - Link to v2: https://lore.kernel.org/r/20260921-stmmac-rx-mb-v2-1-6e826e=
1ff306@oss.qualcomm.com
>=20
> Changes in v2:
> - Rely on xdp_buff_add_frag() to create xdp fragments
> - Fix bugs in rx_q state recording
> - Fix the corner case where we receive more than MAX_SKB_FRAGS fragments
> - Cosmetics
> - Link to v1: https://lore.kernel.org/r/20260918-stmmac-rx-mb-v1-1-0b4517=
d404af@oss.qualcomm.com
>=20
> ---
> James Hilliard (1):
>       net: stmmac: take ownership of saved RX state at poll entry
>=20
> Lorenzo Bianconi (1):
>       net: stmmac: rework stmmac_rx to support XDP rx multi-buff
>=20
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   3 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 390 ++++++++++++++--=
------
>  2 files changed, 250 insertions(+), 143 deletions(-)
> ---
> base-commit: a5e7d8e446af9803e37a3b6a4d416fb41178348f
> change-id: 20260918-stmmac-rx-mb-16469a2714ea
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--wgndA7NxLnWRH+t1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasjCMgAKCRA6cBh0uS2t
rG50AQCJYxpyUnrWTKBC3SmBXC/JWh1W3xsif267HbbxwknqiAD9HAjk7mvQ9cxN
BvH8j35NkTDGkCOs7eHeKweP/asd7As=
=5yYK
-----END PGP SIGNATURE-----

--wgndA7NxLnWRH+t1--

