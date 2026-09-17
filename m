Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECCAC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 17:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RiLUTK8pLQQMWX+C1g6PNvcBiveJnZkCvbZEp3/30IM=; b=YlUalHBT1XmaISt+HDvwrnRJoQ
	bptVBVj0RU+Dv0oGPUvC2LHj56rOjwjhYeYztNRwTI44XHZjMpwoXdvTmED+ALO3xSsY1kRxFaqfc
	C25PFQQhNgsJy5E3zHnj6RNt5w4KnK994HaPp2HkLNEcl8RlCZpKXB27n3BoC/rw7kaVRp2kls3YO
	+RHoa7eTFRjzmenUHZNTpqKbrbOboxzkn9csa9inrN/tibzF1fQScylj0gawQaVAlIAyl9ZH2jwmb
	/ixnYDt4S8TyjmUslJ6j7/DG4qrdvlMDVeXvYLS//Q77PPQ9U1/BE6WXAqWQ1GRCaIuO7YJmLpyOV
	cqjj2XFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G37-0000000C6Ke-1cNB;
	Thu, 17 Sep 2026 17:37:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7G35-0000000C6Jo-0kiI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 17:37:28 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HH5fLX2170967
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 17:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RiLUTK8pLQQMWX+C1g6PNvcB
	iveJnZkCvbZEp3/30IM=; b=HQvbYjwwjk5GaVNODVw65EvnkLxnC3BJy5uItFuJ
	bCHneyKtmUfJQyIILksEEKd38z9MGhNeFMOG23lPRXd2v/AFwGdwBGzFHMQXfB22
	/Iz7boVtV6fDdBZMdnVFqxf3Y+aKr3T+6YdgugsxppcV30yNfqmEIa6BoSKW6+9B
	48rTUSGlHs0U8kKqgLHnQNhCsb7QtRt5gGuuwCCKGjPrZAiSXslrAFWHyg2znvBI
	Y7W3DVny5KEq+GW7BXcbZEGBcQxqpSD5HZ6Gw4/Dm+j04Zp8pmdX8gWTOa9z099/
	MZETRN0NOSASY2QfZkCVHRJHcLa6hGvu5m3SYI43TP6/fw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grk97rgs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 17:37:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f248907fso117618985a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 10:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789666645; x=1790271445; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RiLUTK8pLQQMWX+C1g6PNvcBiveJnZkCvbZEp3/30IM=;
        b=CCEitcGS+zQ4FdRRjOiSMH/ATdRJVkY0xPFb70r9o+bVBwKvmR4j6jMac7VWKEJ81e
         mpHOqTxhcPvszEXE7Vd1Cwdd2odh2OD67tMxmOZAuahXldfWSaYHzWLOr7P4TQS4Y6+Q
         yYc3nTtDuY5VwWl3KeSxWYdv6/Sz2biqWmOhP2zlfDu+lwElewsU9acjZR2W1rToQOul
         6uGNNyFtracFXT6CMibe5uVEFq6y8weD5NwDPV++1Dh9Cs7VFHGOVUy9pjESK3OYFHpG
         blQroeJmHH5HcT+GUwaJgitPriDfhwvoxNTADHcAzhq1Z7b3dH3M8wvAKKEdVuw5dLZa
         6hcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789666645; x=1790271445;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiLUTK8pLQQMWX+C1g6PNvcBiveJnZkCvbZEp3/30IM=;
        b=XnsTTRXMof/MhFG2qnbHZY2/NWAJmVaGpb4zi7wStalT8M5knqyVq1HBebJTAwcoiO
         0Nd9RRLAHXKNRlfBb1R9NpJEvxRcbyPAz5ftq7zNG3kkXGJGBGrTzGIQDNgNBDnU/eSL
         vTSdMt9XqAanFGOy3ozw5BgkP7UUmyFwQ6+JkEXcWd6fF9cFkza58o378x3RqurRxEbl
         bow+f4vqF6f/xz2YIGN1hu0LqGVk/ZCwmjvLMHbHLNCqdPPmsDKpQehSnNO4SHgkjFJ+
         TBGFUg21U54Rwf9lkA0TePym6JX2CTjik96997+lLDrV9GoCqHpx11MSeixDwaYcmKIX
         wdsw==
X-Forwarded-Encrypted: i=1; AKwUvBwchSj78F5lHAWu9r4QOMVMoXmNar10LQHXuGUihvbHLkGldfNlAD20pG3QFSzSPhRAmesj571saSK5nVRAWMam@lists.infradead.org
X-Gm-Message-State: AFuF++kYQE720lGNRgM5TkBN91dW+d1be+phqcm1KZwA+b8rhXQUole3
	5kJK9rW7oVG940xy56A+dXhN16f66EceW4ELO5UKvNPrePGOA5UTNE5F14nxImDiZWTMDpgJAGC
	hpTNFT3mTPw32ozfj3y4R/OZ+wyS27cxCp2IOFy+JdVbYwb5Q38PeJBQxXPtROnZawBnpJyAbOQ
	STCg==
X-Gm-Gg: AYBFou3X8djDEqfnQYTFBFY1kWqeZnifeKbNdMPyTu5zTvgJZlv8HO3PJ7KD/C9ZSE2
	Y40j13slvUcInWtw4Y2hPBMmYPjZ8XFKCXo6WqqL9iE/bIsVuQZMCCQWPyPSFjRpM4fXLSbPgmY
	zXZbI2Y9KYnYXYXSbyqFBKaJRPbh3IXleJtmA/xGTW4HbiBuQ6XvuZRoFgewLWe405Eg239E2en
	LmnbZrmrfGcUw4uU3R/VBsVybN+4Cz0KlSuslKAUNcagIQEUNWiGPo32/s6EQGoq/m1KMHKbp2/
	MzfJRGksugRZVdw5AekuCceoFLnj+UEkmhKtcLwGssOEp2Ky2LfdI0YAonb15pd7e0WebQnXkpv
	tc4qqHGCUOG9nuvWM8U7PfPic/7/MtSoxRoOc
X-Received: by 2002:a05:620a:6488:b0:937:7e90:ecc with SMTP id af79cd13be357-93bb791a336mr1166926085a.25.1789666645000;
        Thu, 17 Sep 2026 10:37:25 -0700 (PDT)
X-Received: by 2002:a05:620a:6488:b0:937:7e90:ecc with SMTP id af79cd13be357-93bb791a336mr1166920285a.25.1789666644423;
        Thu, 17 Sep 2026 10:37:24 -0700 (PDT)
Received: from localhost (77-32-99-124.dyn.eolo.it. [77.32.99.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27df9sm17600420f8f.19.2026.09.17.10.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:37:23 -0700 (PDT)
Date: Thu, 17 Sep 2026 19:37:21 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Linkui Xiao <xiaolinkui@126.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linkui Xiao <xiaolinkui@kylinos.cn>, stable@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: do not cache the new TSO MSS before it
 reaches the DMA
Message-ID: <aqwlUWN3rAXfcaWr@lore-qca>
References: <20260917124234.1348673-1-xiaolinkui@126.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zK4cZSasZmlQ8lcH"
Content-Disposition: inline
In-Reply-To: <20260917124234.1348673-1-xiaolinkui@126.com>
X-Authority-Analysis: v=2.4 cv=LOzz05W9 c=1 sm=1 tr=0 ts=6aac2555 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oN7owVyBLNHHe3W6XE6vpg==:17
 a=K11jTO6jPfkTDgbD:21 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=TAmxZOqScj0W_Gg8AvoA:9 a=CjuIK1q_8ugA:10
 a=wOP-5i2p18UGaVo_UgQA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDI1MSBTYWx0ZWRfX9isaTAoIBYgH
 AJpSow6Y5JWRUhL9AlvrlAxpcVxYNVDBxwZn8Gzf+ZoB0eSGUcIA+oKTqerB74G4tek+O+TZjrZ
 AyWRUg9ek9fF/Y4hn0Odx6KuPXdxBkuMSMrM9qjl55jn6GvplJPXI+tR0nnmhOjFW8sbzGpmt8f
 OFcZLcCLPwcPBpSy7iG0QFGwAmhGeZTGttSKVevmLDYHr35CxCl3dGJ0gr9KuBIFhtHfAOe6aY1
 kB94au3QpdukeLwS4P7pu4z8pPlOkdB9reCjRdiAw8JeBvymu3vSh5kNqMWll1c/twgDjidXOsO
 Cl7XrrBJKtNgIf0du/5b4IfG/bCixo0f2Efac7IQyzIWzrJsm04sLI1AouSuJDXT5tdEDnfsjS9
 yWcne9FdDuHYCqW17riBpmfUa+6t8tqMEx9iWYZpZtWLqDBT0L5hYnflYL6FDxWyPMe6dS2zJ6D
 2VEVj7sjlJ/KL+IpUdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDI1MSBTYWx0ZWRfX4BFBmVMFdwso
 r0Y5UYGT424kDFx88KoHQCKLcgTK185m2Cvszaq2hZJLYW93E01tPDsQCpdpJnqoxuXXSsVKXsu
 Y1Q1RXPgfHZEt9yFXgqkbdFfg8CIrNE=
X-Proofpoint-ORIG-GUID: F04rVS5EnRQd-guaO9-vSZA6Oh0gkgsc
X-Proofpoint-GUID: F04rVS5EnRQd-guaO9-vSZA6Oh0gkgsc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170251
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_103727_334363_9FD5F668 
X-CRM114-Status: GOOD (  28.35  )
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

--zK4cZSasZmlQ8lcH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Linkui Xiao <xiaolinkui@kylinos.cn>
>=20
> stmmac_tso_xmit() fills the MSS context descriptor and stores the new
> MSS in tx_q->mss right away, but the descriptor only gets its OWN bit
> much later, right before the frame is handed to the DMA. Every error
> path in between - the dma_map_single() of the linear part and the
> skb_frag_dma_map() of each fragment - returns with tx_q->mss already
> updated while the MAC is still programmed with the previous MSS; the
> abandoned context descriptor is later reclaimed by stmmac_tx_clean().
>=20
> The next skb carrying the same MSS then compares equal to the cached
> value, so no context descriptor is emitted and the hardware segments
> the TCP stream with a stale MSS, generating frames whose payload size
> does not match what the stack accounted for.
>=20
> Only update tx_q->mss once the context descriptor has been given to the
> DMA so that the cached value always describes what the hardware is
> actually programmed with.
>=20
> Fixes: f748be531d70 ("stmmac: support new GMAC4")
> Cc: stable@vger.kernel.org
> Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index af2d38a2bb3d..a8f94cd6abb4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4563,7 +4563,6 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *=
skb, struct net_device *dev)
>  			mss_desc =3D &tx_q->dma_tx[tx_q->cur_tx];
> =20
>  		stmmac_set_mss(priv, mss_desc, mss);
> -		tx_q->mss =3D mss;
>  		tx_q->cur_tx =3D STMMAC_NEXT_ENTRY(tx_q->cur_tx,
>  						priv->dma_conf.dma_tx_size);
>  		WARN_ON(tx_q->tx_skbuff[tx_q->cur_tx]);
> @@ -4714,6 +4713,7 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *=
skb, struct net_device *dev)
>  		 */
>  		dma_wmb();
>  		stmmac_set_tx_owner(priv, mss_desc);
> +		tx_q->mss =3D mss;

I think the issue is real. A couple of comments:
- do you think we should run stmmac_release_tx_desc() on mss descritpr in o=
rder
  to clean it up?
- I guess we should use the same approach used for data descriptor and adva=
nce
  tx_q->cur_tx when there are no other possible error condition. What do you
  think?

Regards,
Lorenzo

>  	}
> =20
>  	if (netif_msg_pktdata(priv)) {
> --=20
> 2.25.1
>=20
>=20

--zK4cZSasZmlQ8lcH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqwlUQAKCRA6cBh0uS2t
rG/tAQCSC+2RVhkLKndRbYfTihT9iTa12YhuEwvfzDeB1cr3DwD/TRnCLF4KT631
skR5J9p37gUdnEYuDX9/wAnd5jh0hwM=
=X0mQ
-----END PGP SIGNATURE-----

--zK4cZSasZmlQ8lcH--

