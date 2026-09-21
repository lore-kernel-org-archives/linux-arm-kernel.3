Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13929C982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 14:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/gwWEIz1AsyoBOk6om1UyU67tFKHPZ78bO/c/d+swM=; b=do0cFOuxrdiHS5wo2Il6MgGgHv
	bM5qmiom6ZR+BvtUXa1b59STYamt3u/zsimFOEys6uPt3h+UJVD51vLIAp83yHEO8CClyom7nThOc
	5SFykpYxbFoO3BNIaz/PWEKWuS4XhPm36xHw8CJGvAk/KBSs6eCKEEWOVAdvs87SR00KWAdT7W717
	KgVU0es28JtRk+oynwFmpc++2IYQ9YJpygthca19yH1TcywV0p6LqOgmXSXtzcMSxOztqsbDZhPd1
	d5p0JAwM1XDxHpgr5d1fDGFE5WWPNMKlGz5xX8VwyD76kNOY36ku+gIO5xcVpzsGC8YOJLKnSizG8
	HUp+24cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fLP-00000002SX9-09lA;
	Mon, 21 Sep 2026 14:50:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fLG-00000002SPl-0ro4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 14:50:06 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LEGWJx2568116
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L/gwWEIz1AsyoBOk6om1UyU6
	7tFKHPZ78bO/c/d+swM=; b=WnmX2tIArH1jLrM2K2QzU8yNAZzTmpiwDDWBr+qS
	FdWA2MplhFvI+KdFSfQwmIkvkiFdg9zzwb8JG9YD+Wc82ud+hFF5++s8JdxFUvRN
	YrSRdkKA4erHSQ1z9lQyWbY3dgFkzKVDwkTXPGqVKuhk2WcNwU7er4Fsgn0dvWiH
	HqpPUw4i2hJ5clZJrm+kGTQfIZEey6zAxPYJz7+i+CSm2ACx2izlrJBbY1XsVeGT
	IZCI73gvlJfOnHZzrD6OQ3IwGgfVTNLeBSee3mH1RmFNnAKGyQcxyr9f6qsQORme
	gvAA3E+MTc4pC21YYhPwvnFKZjbd+mixYBJhVWLxdUGlVQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wtwvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 14:50:01 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cb2f3c6f7so247149241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 07:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790002200; x=1790607000; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L/gwWEIz1AsyoBOk6om1UyU67tFKHPZ78bO/c/d+swM=;
        b=OWb7ohZVo9Yfzk7g2yolDVYdEzm0WkI8SiI+4Nk5wQamybxMbaay/5zR45uS8E4phf
         yUYpmVPEQdT0Hq7SPPDFVTE0vMf1lz0MAlisb9mphY+pyCplfaaZWIuznghBQCDIw+V7
         JIRiEkFR5PKloHbwILo7j1+UheHEUvbl+TAcS55NUGXbSWvL6zbvjKeyJNN2haxNDQtG
         8FXXMRj57t7dPSz1PLbUqz1dHNjhC/1hk17R48g44OaDaoASETPSnHOxP6tGHjjKXDok
         G504MMpYRHAcoDGU/PLYbI0z5W/gmDl6sW/o3qY+y3D8RGxj9UdSWyXQucliZ1AsbXPv
         Cgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002200; x=1790607000;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/gwWEIz1AsyoBOk6om1UyU67tFKHPZ78bO/c/d+swM=;
        b=IMzL0DlLV6BUM5EkoIcObEbj11PpZnfljVgNCy1i0ayI1n5gsPqho8J4rAo1pFdsKU
         PicRLsh7M1etM5+9+d+oslygrysD5WXtZtLV2dzWzmBzb+/hm3eMVvS1P0S1apjAPCup
         A6HlFpKGWDR5dZU9IxwRJlxV4kBu3CYtXuX4dyc8KYpbWB30jdcIGKWCvuOW4YGJzBVQ
         dKWBd9I1VOMNWYkAwj3inCD+RQ7PR8tW2WeQ8n+e3GZR0My2KRFWHiR4fopDxBn4/MCb
         xEzT8++R345idIxIsAIuWNJc6oxkfeLiVO35XD6/6FANFnATl8t9SndGkZCBH+aXCKQQ
         7ynQ==
X-Forwarded-Encrypted: i=1; AKwUvBwk1ZTOddNV9TBlx4erdmQKLJKpvxx+tqqI9W+vJ2VmWCpfwHGqQ7S3xZoMidmNEwslS8ToEm0Lxli6hBXvQ8TF@lists.infradead.org
X-Gm-Message-State: AFuF++kjWqHVu4B9Qk7afit18MJ9fXh2JLaKW18D+25jocGiZxXrC3S/
	TfXlIiz+cFUO3Qwe7N8KsovD41AbVhQoy8q1us3AiCLzlkqu8/8XRjdK89isIw+xD45AM+jkAny
	CApThm7YipNILMQglePFLZyEioMCO00fiO0BeD9p0VTR+IBkd92a/5LtdOUn5hB1J2YdOHRQQiD
	G4NA==
X-Gm-Gg: AYBFou1EF1L7+EwzYEgmSlEnNNkwY2XYQ72v+ODys0donykgrFQCPJ59Bl2sYD7TPny
	nM0pkVbIwar/Pcr2oF8XZWBqlNDJqt1heeJOpDpnED8eOZR96kTcT6HNW8NGgG75mEr9JKoiN+9
	Bx8irSntGB672tPIt8mcoxud+DJkW/eWEeANpjJyYiqhICrvywtfinm18MjLxBZFss9bGtWQ0+P
	A6vZ92YZwBY8cnPKD7rEbmqB4Mz5uxHIM3mXzRPpIdz0bUEwxg4z3IejmXH6PBopKAgSZgr5Y5v
	w0nhBk9p+gM+3dXWExtj5SvkxvcRkCB6TgDEUGP+xdLECNpFtI4h3PJO3eE03Lt4rH0/BCLjGHA
	7CZZbSCeYMJAFqA==
X-Received: by 2002:a05:6122:553:b0:5c6:5daf:52ea with SMTP id 71dfb90a1353d-5c9b8a8a575mr5396594e0c.6.1790002200308;
        Mon, 21 Sep 2026 07:50:00 -0700 (PDT)
X-Received: by 2002:a05:6122:553:b0:5c6:5daf:52ea with SMTP id 71dfb90a1353d-5c9b8a8a575mr5396523e0c.6.1790002199580;
        Mon, 21 Sep 2026 07:49:59 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487244229d5sm24485345f8f.2.2026.09.21.07.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:49:58 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:49:58 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sashiko@kernel.org
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        Jose.Abreu@synopsys.com, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: fix rx Scatter-Gather support
Message-ID: <arFEFu6yJ1Go-Dxq@lore-desk>
References: <20260916-stmmac-rx-sg-fix-v1-1-b49b7b8f725f@oss.qualcomm.com>
 <178991882229.2160803.15018709305891810820@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/S7OYVNDFFm+zIJk"
Content-Disposition: inline
In-Reply-To: <178991882229.2160803.15018709305891810820@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIxNiBTYWx0ZWRfX/SmnZqyrVgSI
 K+iuJIMZ2/fk2EShro8i/DpTLF5y9lKG7KFw+rGYM2HmuRr3mxsv14yUy5FCu7m5T6S7qWONJq/
 DKTLE7STWPVh2VFXdQ+W0vmr+ZXFjBXABCEoqZ6IzydXjy3QGGpHFclPaL6kLi6DxjVQQ8xjaMt
 Msqj0rf1sP7aMEkxGvp+duKtcwC5e07mQ4vPxiuQpqS03Hv+W56tHmvT7b9bKhDhQyuaV2RaAV/
 4+6lIo1Ipo4c9BZ1y90PA9mIXC3P8h8i3EzZg6woUWteXwrMgeIWM2ulRQTEs9aKI/hJXbxFnUq
 wmgzkHM5IiI2ItFTIQphPR1gW26Ym3RkoxzoIxaZjE+6IcV7d67N1u2Xt88v8HglXh4P8rYvCI0
 dWeeiNdBoZSr1vXyLZh5sY1xla/wc4PgO8DEmrScVuIEDQaQTFO0VzqteL2uAPW2nHB0ZLSIQRc
 1tFWTTqnngktKA6c7eA==
X-Proofpoint-ORIG-GUID: xodnD9DUaaecJEK66unPcNtFRLzabJBe
X-Proofpoint-GUID: xodnD9DUaaecJEK66unPcNtFRLzabJBe
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab14419 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=9R54UkLUAAAA:8
 a=EUspDBNiAAAA:8 a=jrpQDATgEUwx6AQAYaYA:9 a=QEXdDO2ut3YA:10
 a=_YWb-uPXFNQ7D31LLysA:9 a=TOPH6uDL9cOC6tEoww4z:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIxNiBTYWx0ZWRfX/Dg3pay+6S7E
 7td0F8U3Yb89ppC6nWivDmwOvM+rKTi0/SYVwXs3hutTL7sVlDt8O2DN0NFanIYNTopT9CTeO34
 x+axgp09SdchM2PFuvw+nbJeXFhxlRU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_075002_282976_F07042CC 
X-CRM114-Status: GOOD (  43.64  )
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

--/S7OYVNDFFm+zIJk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 9 potential
> issue(s) to consider.
>=20
> Critical: 1 =C2=B7 High: 1 (1) =C2=B7 Medium: 6 =C2=B7 Low: 1
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Critical] stmmac_rx() strips the FCS with an unchecked unsigned
>   subtraction (`buf2_len -=3D ETH_FCS_LEN` at stmmac_main.c:5803,=E2=80=A6
> - [High] The patch unconditionally allocates a secondary RX page and
>   unconditionally reports a non-zero buffer2 length for every MAC core,=
=E2=80=A6
> - [Medium] The RX page pool is created with `pp_params.offset =3D
>   stmmac_rx_offset(priv)` and `max_len =3D dma_conf->dma_buf_sz`, and onl=
y=E2=80=A6
> - [Medium] For GMAC4 without SPH, stmmac_rx_buf2_len() now assumes every
>   intermediate descriptor's buffer2 is completely filled (returns=E2=80=A6
> - [Medium] The patch makes the secondary page-pool page mandatory for
>   every RX descriptor on every stmmac device and configuration=E2=80=A6
> - [Medium] With a native XDP program attached, stmmac_xdp_set_prog()
>   explicitly clears priv->sph_active, and this patch now arms buffer2=E2=
=80=A6
> - [Medium] The AF_XDP zero-copy refill path is left untouched:
>   stmmac_rx_refill_zc() still calls `stmmac_set_desc_sec_addr(priv,=E2=80=
=A6
> - [Medium] The new length arithmetic depends on `priv->hw->rx_csum`,
>   which stmmac_set_features() (stmmac_main.c:6210-6214) mutates from=E2=
=80=A6
> - [Low] The descriptor-position comments in the changed RX length helpers
>   no longer describe the code.

I will address sashiko's comments in v2.

Regards,
Lorenzo

>=20
> Pre-existing issues:
> - [High] In stmmac_rx(), when napi_build_skb() fails the code calls
>   page_pool_recycle_direct(rx_q->page_pool, buf->page) and jumps to=E2=80=
=A6
>=20
> --
>=20
> net: stmmac: fix rx Scatter-Gather support
>=20
> The patch always allocates and programs the secondary RX buffer (sec_page)
> instead of doing so only when split-header is active, so that a frame
> overflowing buffer1 does not make the DMA write to an unmapped address.
> stmmac_rx_buf1_len() and stmmac_rx_buf2_len() are adjusted to account for
> buffer2 in the non-SPH case.
>=20
> A few questions about the buffer2 accounting and the cores/paths that are
> now affected.
>=20
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/driver=
s/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 1fb5f804ea234..be7cb0cafeb50 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -1659,17 +1659,14 @@ static int stmmac_init_rx_buffers(struct stmmac=
_priv *priv,
> >  		buf->page_offset =3D stmmac_rx_offset(priv);
> >  	}
> > =20
> > -	if (priv->sph_active && !buf->sec_page) {
> > +	if (!buf->sec_page) {
> >  		buf->sec_page =3D page_pool_alloc_pages(rx_q->page_pool, gfp);
> >  		if (!buf->sec_page)
> >  			return -ENOMEM;
> > =20
> >  		buf->sec_addr =3D page_pool_get_dma_addr(buf->sec_page);
> > -		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
> > -	} else {
> > -		buf->sec_page =3D NULL;
> > -		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, false);
> >  	}
> > +	stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
>=20
> [Severity: High]
> Does the "always mark buffer2 as valid" part hold on the legacy cores?
> Only dwmac4_descs.c and dwxgmac2_descs.c provide a set_sec_addr callback;
> enh_desc_ops (dwmac1000) and ndesc_ops (dwmac100) do not, and the
> dispatch macro silently skips an absent callback:
>=20
> drivers/net/ethernet/stmicro/stmmac/hwif.h:stmmac_do_void_callback() {
> 	int __result =3D -EINVAL; \
> 	if ((__priv)->hw->__module && (__priv)->hw->__module->__cname) { \
> 		(__priv)->hw->__module->__cname((__arg0), ##__args); \
> 	...
> }
>=20
> So on those cores buf->sec_addr is never handed to the hardware, and in
> ring mode with 16 KiB buffers the hardware buffer2 is inside the primary
> page anyway:
>=20
> drivers/net/ethernet/stmicro/stmmac/ring_mode.c:refill_desc3() {
> 	if (priv->dma_conf.dma_buf_sz =3D=3D BUF_SIZE_16KiB)
> 		p->des3 =3D cpu_to_le32(le32_to_cpu(p->des2) + BUF_SIZE_8KiB);
> }
>=20
> With the "!priv->sph_active" early return gone from stmmac_rx_buf2_len(),
> buf2_len becomes non-zero on those cores too, and stmmac_rx() then does:
>=20
> 	if (buf2_len) {
> 		dma_sync_single_for_cpu(priv->device, buf->sec_addr,
> 					buf2_len, dma_dir);
> 		skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
> 				buf->sec_page, 0, buf2_len,
> 				priv->dma_conf.dma_buf_sz);
>=20
> Can this publish the contents of a page the DMA never wrote to the network
> stack?  On dwmac1000/dwmac100 the intermediate descriptors of a scattered
> frame are discarded by enh_desc_get_rx_status()/ndesc_get_rx_status(), so
> the last descriptor is processed with len =3D 0 and its FL field is the t=
otal
> frame length; a 3000-byte frame with dma_buf_sz =3D 2048 would give
> buf1_len =3D 2048 and buf2_len =3D 952 out of the untouched sec_page.  For
> larger jumbo frames buf2_len (plen - dma_buf_sz) can also exceed the
> order-0 sec_page.  Should buffer2 be gated on the cores that can actually
> program an independently mapped buffer2?
>=20
> [Severity: Medium]
> The secondary buffer is handed to the DMA at page offset 0, but the page
> pool is only configured with offset 0 when SPH is active:
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:__alloc_dma_rx_desc_res=
ources() {
> 	pp_params.offset =3D stmmac_rx_offset(priv);
> 	pp_params.max_len =3D dma_conf->dma_buf_sz;
>=20
> 	if (priv->sph_active) {
> 		pp_params.offset =3D 0;
> 		pp_params.max_len +=3D stmmac_rx_offset(priv);
> 	}
> }
>=20
> net/core/page_pool.c:__page_pool_dma_sync_for_device() {
> 	dma_sync_size =3D min(dma_sync_size, pool->p.max_len);
> 	__dma_sync_single_for_device(pool->p.dev, dma_addr + pool->p.offset,
> 				     dma_sync_size, pool->p.dma_dir);
> }
>=20
> With !sph_active the pool syncs from dma_addr + NET_SKB_PAD + NET_IP_ALIG=
N,
> so the first bytes of every secondary page are given to the device without
> a sync-for-device, both on first map and on recycle.  On a non-coherent
> platform, can a dirty cache line in that prefix be written back over data
> the device has already placed there?  The SPH path sets offset =3D 0 for
> exactly this reason.
>=20
> > @@ -5097,7 +5094,7 @@ static inline void stmmac_rx_refill(struct stmmac=
_priv *priv, u32 queue)
> >  				break;
> >  		}
> > =20
> > -		if (priv->sph_active && !buf->sec_page) {
> > +		if (!buf->sec_page) {
> >  			buf->sec_page =3D page_pool_alloc_pages(rx_q->page_pool, gfp);
> >  			if (!buf->sec_page)
> >  				break;
>=20
> [Severity: Medium]
> This makes a second page-pool page mandatory for every RX descriptor on
> every stmmac device, doubling the RX buffer footprint (order-2/order-3
> pages for the 8/16 KiB bfsize cases), while pp_params.pool_size stays at
> dma_conf->dma_rx_size, i.e. the recycle ring is now sized for half the
> in-flight pages.
>=20
> For MTU-conformant traffic dma_buf_sz is always above the MTU:
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_set_bfsize() {
> 	if (mtu >=3D BUF_SIZE_8KiB)
> 		ret =3D BUF_SIZE_16KiB;
> 	...
> 	else
> 		ret =3D DEFAULT_BUFSIZE;
> }
>=20
> so buffer1 alone holds the frame and the second page is unused.  Could the
> commit message state in which configuration an in-spec frame exceeds
> dma_buf_sz, and mention the extra page per descriptor plus the pool_size
> mismatch?
>=20
> > @@ -5108,10 +5105,7 @@ static inline void stmmac_rx_refill(struct stmma=
c_priv *priv, u32 queue)
> >  		buf->addr =3D page_pool_get_dma_addr(buf->page) + buf->page_offset;
> > =20
> >  		stmmac_set_desc_addr(priv, p, buf->addr);
> > -		if (priv->sph_active)
> > -			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
> > -		else
> > -			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, false);
> > +		stmmac_set_desc_sec_addr(priv, p, buf->sec_addr, true);
> >  		stmmac_refill_desc3(priv, rx_q, p);
>=20
> [Severity: Medium]
> Native XDP always runs in the non-SPH mode that this patch now arms
> buffer2 for:
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c:stmmac_xdp_set_prog() {
> 	priv->sph_active =3D priv->sph_capable && !stmmac_xdp_is_enabled(priv);
> }
>=20
> In stmmac_rx() the program only ever sees buffer1:
>=20
> 	xdp_prepare_buff(&ctx.xdp, page_address(buf->page),
> 			 buf->page_offset, buf1_len, true);
>=20
> and on a TX/redirect verdict the loop leaves before the buf2_len block:
>=20
> 	} else if (xdp_res & (STMMAC_XDP_TX |
> 			      STMMAC_XDP_REDIRECT)) {
> 		xdp_status |=3D xdp_res;
> 		buf->page =3D NULL;
> 		skb =3D NULL;
> 		count++;
> 		continue;
> 	}
>=20
> XDP caps the configured MTU at ETH_DATA_LEN, but GMAC_CORE_INIT in
> dwmac4.h contains GMAC_CONFIG_JE and XGMAC_CORE_INIT_RX programs
> GPSL =3D XGMAC_JUMBO_LEN, so an oversized frame is still accepted and spl=
it.
> Does this silently forward a truncated frame, and should the multi-buffer
> case be rejected instead?
>=20
> [Severity: Medium]
> The AF_XDP zero-copy refill path is left as it was:
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_rx_refill_zc() {
> 	stmmac_set_desc_addr(priv, rx_desc, dma_addr);
> 	stmmac_set_desc_sec_addr(priv, rx_desc, 0, false);
> }
>=20
> but on XGMAC the validity argument is ignored and there is no BUF2V bit in
> the RX read descriptor:
>=20
> drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c:dwxgmac2_set_sec_add=
r() {
> 	p->des2 =3D cpu_to_le32(lower_32_bits(addr));
> 	p->des3 =3D cpu_to_le32(upper_32_bits(addr));
> }
>=20
> so buffer2 stays armed at DMA address 0 while RBSZ for a ZC queue is
> xsk_pool_get_rx_frame_size() and GPSL is the jumbo limit.  Is the SMMU
> translation fault quoted in the commit message still reachable on this
> path?  The multi-descriptor rejection in stmmac_rx_zc() happens after the
> DMA write.
>=20
> > @@ -5160,7 +5154,7 @@ static unsigned int stmmac_rx_buf1_len(struct stm=
mac_priv *priv,
> >  	plen =3D stmmac_get_rx_frame_len(priv, p, coe);
> > =20
> >  	/* First descriptor and last descriptor and not split header */
> > -	return min_t(unsigned int, priv->dma_conf.dma_buf_sz, plen);
> > +	return min_t(unsigned int, priv->dma_conf.dma_buf_sz, plen - len);
> >  }
>=20
> [Severity: Low]
> This isn't a bug, but the descriptor-position comments here no longer
> match the code.  The non-first-descriptor early return at the top of
> stmmac_rx_buf1_len() is gated on priv->sph_active, so with non-SPH
> scatter-gather a continuation descriptor (len !=3D 0) falls through to the
> branches commented "First descriptor, not last descriptor and not split
> header" and "First descriptor and last descriptor and not split header",
> while plen - len only makes sense for a continuation descriptor.
>=20
> > @@ -5170,10 +5164,6 @@ static unsigned int stmmac_rx_buf2_len(struct st=
mmac_priv *priv,
> >  	int coe =3D priv->hw->rx_csum;
> >  	unsigned int plen =3D 0;
> > =20
> > -	/* Not split header, buffer is not available */
> > -	if (!priv->sph_active)
> > -		return 0;
> > -
>=20
> [Severity: Critical]
> With this return gone, the last-descriptor path returns the exact
> remainder plen - len, which can be 1, 2 or 3.  stmmac_rx() then strips the
> FCS with an unchecked unsigned subtraction:
>=20
> 	/* ACS is disabled; strip manually. */
> 	if (likely(!(status & rx_not_ls))) {
> 		if (buf2_len) {
> 			buf2_len -=3D ETH_FCS_LEN;
> 			len -=3D ETH_FCS_LEN;
> 		} else if (buf1_len) {
> 			buf1_len -=3D ETH_FCS_LEN;
> 			len -=3D ETH_FCS_LEN;
> 		}
> 	}
>=20
> and passes the result straight on:
>=20
> 	if (buf2_len) {
> 		dma_sync_single_for_cpu(priv->device, buf->sec_addr,
> 					buf2_len, dma_dir);
> 		skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags,
> 				buf->sec_page, 0, buf2_len,
> 				priv->dma_conf.dma_buf_sz);
>=20
> Can a frame that overflows a buffer boundary by 1..3 bytes wrap this?
> GMAC_CORE_INIT in dwmac4.h sets GMAC_CONFIG_JE unconditionally, so with
> MTU 1500 and dma_buf_sz =3D DEFAULT_BUFSIZE =3D 1536 a 1537-byte frame is
> accepted and split as 1536 + 1.  On that first-and-last descriptor
> stmmac_rx_buf1_len() returns min(1536, 1537 - 0) =3D 1536, then
> stmmac_rx_buf2_len() returns 1537 - 1536 =3D 1, and 1 - 4 gives 0xfffffffd
> being handed to dma_sync_single_for_cpu() and skb_add_rx_frag().  The
> buf1_len branch is reachable the same way with frames of
> 2 * n * dma_buf_sz + 1..3 bytes, and stmmac_rx_zc() also subtracts
> ETH_FCS_LEN from stmmac_rx_buf1_len() unconditionally.  Before this patch
> the non-SPH path returned 0 here, and in SPH mode buffer1 ends at the
> split header so the whole FCS always landed in buffer2.
>=20
> >  	/* For GMAC4, when split header is enabled, in some rare cases, the
> >  	 * hardware does not fill buf2 of the first descriptor with payload.
> >  	 * Thus we cannot assume buf2 is always fully filled if it is not
> > @@ -5188,8 +5178,9 @@ static unsigned int stmmac_rx_buf2_len(struct stm=
mac_priv *priv,
> >  	 * Thus 'plen - len' always gives the correct length of buf2.
> >  	 */
> > =20
> > -	/* Not GMAC4 and not last descriptor */
> > -	if (priv->plat->core_type !=3D DWMAC_CORE_GMAC4 && (status & rx_not_l=
s))
> > +	/* Not GMAC4, or non-SPH and not last descriptor */
> > +	if ((priv->plat->core_type !=3D DWMAC_CORE_GMAC4 || !priv->sph_active=
) &&
> > +	    (status & rx_not_ls))
> >  		return priv->dma_conf.dma_buf_sz;
> > =20
> >  	/* GMAC4 or last descriptor */
>=20
> [Severity: Medium]
> For GMAC4 without SPH this now assumes every intermediate descriptor's
> buffer2 is completely filled, discarding the accumulated-PL value that the
> comment just above describes as always giving the correct length of buf2.
>=20
> The fall-through has no len <=3D plen guard:
>=20
> 	plen =3D stmmac_get_rx_frame_len(priv, p, coe);
>=20
> 	return plen - len;
>=20
> and stmmac_rx_buf1_len() clamps the same wrapped value with
> min_t(unsigned int, dma_buf_sz, plen - len) rather than detecting the
> inconsistency.  One way the assumption can break is the RBSZ field itself:
> DMA_RBSZ_MASK is GENMASK(14, 1) in dwmac4_dma.h and cannot represent
> BUF_SIZE_16KiB, so dwmac4_set_dma_bfsize() writes a truncated RBSZ while
> the driver keeps assuming dma_buf_sz per buffer.  If an intermediate
> buffer2 is short by even one byte, does the accumulated len exceed plen a=
nd
> turn buf2_len into a multi-gigabyte fragment length?  Would a
> plen > len ? plen - len : 0 form be safer here?
>=20
> The commit message says the GMAC4 plus split-header path keeps the
> accumulated payload semantics "since there an intermediate descriptor's
> buffer2 can be only partially filled" - is there a databook statement that
> this cannot happen for GMAC4 outside SPH mode?
>=20
> [Severity: Medium]
> Both helpers read priv->hw->rx_csum independently for the same descriptor
> (int coe =3D priv->hw->rx_csum;) and feed it to stmmac_get_rx_frame_len(),
> whose COE_TYPE1 path subtracts 2 from the descriptor frame length.  The
> writer runs from process context with no synchronization against the RX
> NAPI poll:
>=20
> drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_set_features() {
> 	if (features & NETIF_F_RXCSUM)
> 		priv->hw->rx_csum =3D priv->plat->rx_coe;
> 	else
> 		priv->hw->rx_csum =3D 0;
> 	...
> 	stmmac_rx_ipc(priv, priv->hw);
> }
>=20
> If ethtool -K ethX rx off/on lands between the stmmac_rx_buf1_len() and
> stmmac_rx_buf2_len() reads on type-1-COE hardware, plen in the second call
> is 2 bytes smaller than the one used to accumulate len, so plen - len
> wraps.  Before this patch the non-SPH path returned 0 here and buf1_len d=
id
> no subtraction, so the worst case was a 2-byte length inaccuracy.  Could
> coe/plen be read once per descriptor?
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but while looking at the RX
> buffer lifecycle the patch reworks: in stmmac_rx() the napi_build_skb()
> failure path releases the page without clearing buf->page:
>=20
> 	skb =3D napi_build_skb(page_address(buf->page),
> 			     rx_q->napi_skb_frag_size);
> 	if (!skb) {
> 		page_pool_recycle_direct(rx_q->page_pool,
> 					 buf->page);
> 		rx_dropped++;
> 		count++;
> 		goto drain_data;
> 	}
>=20
> Every other consumption site in the function sets buf->page =3D NULL after
> handing the page away.  With the stale pointer, stmmac_rx_refill() skips
> the replacement allocation and programs the already-recycled page back
> into the descriptor:
>=20
> 	if (!buf->page) {
> 		buf->page =3D page_pool_alloc_pages(rx_q->page_pool, gfp);
>=20
> and at teardown stmmac_free_rx_buffer() puts it a second time:
>=20
> 	page_pool_put_full_page(rx_q->page_pool, buf->page, false);
> 	buf->page =3D NULL;
>=20
> Can this alias one page into two descriptors and underflow the page-pool
> refcount?
>=20
> --=20
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20260916-stmmac-rx-sg-fix-v1-1-b49b7b8f725f%40oss.qualcomm.com

--/S7OYVNDFFm+zIJk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarFEFgAKCRA6cBh0uS2t
rAQbAP9BUCXkextgm7/MXA8UtH5Mbs206aVDhK1sEjPdrxICWAEA5lEOCeOlXxL7
9nvNBE1TUdZ56M6FCvDVBrwlWFxK0A0=
=+E+4
-----END PGP SIGNATURE-----

--/S7OYVNDFFm+zIJk--

