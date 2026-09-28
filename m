Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA406C9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 10:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmcxBMWJs76vC4rB1IExCHHxPy3Iog0aQWSFoBFHf8k=; b=UDaQa2EY2aQDOlzfJQQVeKOakg
	eLc3r7smC5pdAFL4wi5hEHSkf27gGUzKAWxxFJgjdDYsRnqJ+H4/ZO8sJVyTIKBa3SPVZUnV8xk1z
	AtwVEax410Rlo4bB6CwLEIgYo/O4/BqS2r1sxWTiwd9yiZhpHedaNcPUS0Xu2dQBrQkHZI7+19Oqp
	NtY5pRtS9+U9AlqgYJJLd1UlS9vsu5XupmvXzJWv4cvr1Itd3Y8IpF55yJhJ/0cMkfXfzuFA6C6Ay
	rCskp9NtXvS/ylIEaZW9UL03gO1Z5q6AUxePUqB5yDp5aZdSpK37przF79hZf/+ReIqdZ8Uy/Os9J
	QML+ffJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8Cf-00000000J4f-0not;
	Mon, 28 Sep 2026 10:03:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB8Cc-00000000J4B-4231
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 10:03:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MDQ61446199
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lmcxBMWJs76vC4rB1IExCHHx
	Py3Iog0aQWSFoBFHf8k=; b=X/DVCSIueF2X45IOxPTr934ErF+c9Vykcq4UO/cK
	bRxmoyhJG9nCZuei9vZFzvFNsJS7TR6B3h+o6Xn1dnOpXQV04N1DuH75bPWMDOmq
	lkBhQVZSgjTo4l50BYVktttWVQs+lcs5UwYV70+Qjlu0uNF6mdMjHCpfH8TtRDJB
	eCIdTe4/80tTVat40QhMtyZ0CGbdHS7xdmq69x0tOVKE0TrfEOMxTtyLxyoFt4DA
	gvmjxgREqN3kWI5Cobict9ZG+ILbqienQVwpV+ffqH+5/5F7ETqqguYsU8/aUl8A
	yTw+Rq8IASxdjaqFDUA84/sAEFdMN8yXSRgqEX5iJ2hxyA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkr61p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:03:17 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98537d1242aso2632645241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 03:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790589797; x=1791194597; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lmcxBMWJs76vC4rB1IExCHHxPy3Iog0aQWSFoBFHf8k=;
        b=gDC5kekr+2FL4QzU7rvh6XZo01oDYkvhRi7cAQzSoOi+M24Vgo47lqnCOmwLIzapRx
         WdpDE+lTsYzWnUo6j8hoGkeX/YuCbGl2gW95BRh1GLOtXGCtNL+h2yEQtORnVkPpSrLX
         CX0Hdu4oNR8YvnBnMOPZOFGLJOczDzNShv351NHj0Csjh8vdqBdCNw1+nPQRm2VLKNh5
         EJVezKkr6fWebYNsytdDp6x92bIWTfvHXwWKrFZhGn0ThoyO81+/4uAaY6uGw7fbxpuw
         XiN4xQ6z4n9C+OclCw5nVgJPown07VY5uOYMw4hJp0gnSNffKkwih0Hmhf3NWL3X8SAk
         epnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790589797; x=1791194597;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmcxBMWJs76vC4rB1IExCHHxPy3Iog0aQWSFoBFHf8k=;
        b=lQ0O4SPFX9Dethv7FxJIt7Nxqs9/1tX58JH5L4wAhakIzMEHzQIlcZFIu49V2MOy7V
         p2YJY+ZHzjgqKItzitJPfmv+K4V1Fg2lu2zBEqyhWcQXCWGszEYESV1Mh1PHi4xxf0EI
         QLv+yab1/OB0jZ/6qddZpYgn6pXq/AHgUBYUQXGWwx7/5Kvem/RgIk+yNipRth9TdoCV
         x8fGYrGb1gcYDYAMIdMEZY1fAXpvTtUJh/UPy2afWluk2uSaIXXSsSFLV1Yr2oCe6o3j
         w0+5wcJbO4kZ5bGXhJe0cyn3SAUf6aX9iDLz4MHFIaRIJD6CLB7LPXbdSDk7UcIosDj6
         Pu3A==
X-Forwarded-Encrypted: i=1; AKwUvByhHXKZplPZgfp/OMTGLeOZO5y14G0bHtQhDhetDTYSD7ADxm8hD0Nlhtn/KQp+WU4IIlyPACLcl0ria8SeUjZz@lists.infradead.org
X-Gm-Message-State: AFq9FYLQ3+CvCGdI9SAd0NOd5+81fsUXjBwZfvixFjKqqA8qmJ5y3hJ/
	ibIA/lUrSFWr59AEpIbfKdg/OlyJ6p1dMrCkmBdWaid3gohmhuD4pwMFDPrCfS65oe0cTI8dze2
	wgrWatsJos7KNCO6BRHJQsk4LTxnWHJR1mkPjlJgHBKLiLKNyQWPgChw1nPUudJCszAf4E7UM2o
	pmAQ==
X-Gm-Gg: AYBFou0QFNJlK0xWSNb6Z7tQ+yOojPZ+3iEqY94dKE4wxQ4P/foHa7/rys3vQi3IIr3
	Z5NPSRkhNTcM8bXKB8zzOd3ll/uhWrccQmji9U7Tv6SAEGWmPZ8CND44fllOw6jQINgtkXtYgYZ
	og7F9k66UGbH5szbj316P8AzmQLx8OYkpJHU3nCMZo1h40gjvUZhdmUHM2sSxr4XvLuMH5+RQgn
	4fK+yn0/DVPyONl/34McoOUFAkI4lDiKboqnPQ0qpI2TJkvcnbxAFRgHcHUUmUCCQPqegz8ESSn
	/p79P1JQcw5Ju+JF6pKZWdemiMc04LJYmP1/lK0L3jEqQEbVMG/i+LBBQ7Fg7SGHW87Fod/k3RA
	64A9q5wx5V1XPGg==
X-Received: by 2002:a05:6102:5111:b0:7a8:10eb:96ce with SMTP id ada2fe7eead31-7af1c58fab7mr4683030137.4.1790589796932;
        Mon, 28 Sep 2026 03:03:16 -0700 (PDT)
X-Received: by 2002:a05:6102:5111:b0:7a8:10eb:96ce with SMTP id ada2fe7eead31-7af1c58fab7mr4683024137.4.1790589796404;
        Mon, 28 Sep 2026 03:03:16 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm196538545e9.4.2026.09.28.03.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:03:15 -0700 (PDT)
Date: Mon, 28 Sep 2026 12:03:14 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>,
        Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
Subject: Re: [PATCH] net: stmmac: dwxgmac2: enable L2 split header support
Message-ID: <aro7Yijt_d-KRD0Y@lore-desk>
References: <20260922232116.889630-1-sagar.cheluvegowda@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1fVf4XHFdNIN3iOa"
Content-Disposition: inline
In-Reply-To: <20260922232116.889630-1-sagar.cheluvegowda@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOSBTYWx0ZWRfXyq1SaBR5Ww/+
 7WTV/VNnLOzvaYZXfMQHfp9ympGKJlTP8fr/DOCeWxwBTJODd24zmBTD1BfumVaRXFssAyT4WW1
 EYSsQTTi0ouG5Cmyr3Aq8wlMiEKtTB9qQ8Gq4pRFNjKH3+zcX8+bUmValpbnB6FoRoiejOFAAn4
 5I7/n70R+CzrqDwJzOcgDjQH964wZaFRzB9Ny5OCxp2ZW/RBL2g8Abg9+Jg3nnXs93Oa937I4Ag
 NG2L+GyECKFzUKG1IctipzelEBzYsyviIra5MUVmgXRwAzgQ1Uc1Ih2uFzKDnCpiXrOmY5dG4g3
 PigbaQRtQYsprldjA9d/BsxCHgwFvL5II8nxxE+IuRxj3FhIKhootlu44N0ILlh8p7mDNuKl6pI
 csnLlFNb6YXnBybGaMwVnxmASeTMocLk6w5so5LobT/0Iuk7MquYbnjz9mldEkRTNHlXzC3fqiM
 4L6XbeEIIqNxQd6mK7w==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6aba3b65 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=K8_CPFW8AYnmyr30bPQA:9 a=CjuIK1q_8ugA:10 a=TJw6oMfTIKYT8w6ryAkA:9
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: EVxw5d4sC544P8UO9uF-2mNkl20_98L0
X-Proofpoint-ORIG-GUID: EVxw5d4sC544P8UO9uF-2mNkl20_98L0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOSBTYWx0ZWRfX/O9wGzPbMayZ
 zZO8QQYahU26iLeH4TmCDshu5zBszU8raofMlxew95ogNM9/tM1mQqIcuKJjvBXBh7sAVy/5NQb
 zkFFK958s814piTPgynvXTU7F6VidU8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_030319_121338_4229ED37 
X-CRM114-Status: GOOD (  30.32  )
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

--1fVf4XHFdNIN3iOa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> XGMAC2 doesn't program the MAC extended configuration registers
> needed for L2 header splitting when split-header mode is enabled,
> so tagged AV packets can't use the split-header path. Configure
> split mode (SPLM) and header saving (SAVE_EN) in XGMAC_EXT_CFG1,
> extending the dwmac4 sequence added by commit d10f1a4e44c3 ("net:
> stmmac: Programming sequence for VLAN packets with split header")
> to XGMAC2.
>=20
> Also fix the RX header-length calculation for split-header
> descriptors. Per the XGMAC2 descriptor format, RDES3's L34T and
> L2T fields are only valid on the last descriptor (LD set); on a
> non-last descriptor they can hold stale write-back data from a
> previous packet. Read the header length from RDES2[9:0] directly
> for non-last descriptors, and only consult L34T/L2T on the last
> descriptor: RDES2[9:0] for IP packets (L34T set) and RDES2[9:2]
> for non-IP packets (L2T set).
>=20
> Finally, disable the variable-length preamble when L2 splitting
> is enabled. A variable-length preamble shifts the position of the
> Ethernet header, making the L2 split offset non-deterministic.

Hi Sagar,

are we missing to set dma_cap->sphen for dwxgmac2?

>=20
> Co-developed-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
> Signed-off-by: Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
> Co-developed-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
> Signed-off-by: Sarosh Hasan <sarosh.hasan@oss.qualcomm.com>
> Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h       |  7 +++++++
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 12 +++++++++++-
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c   | 10 ++++++++++
>  3 files changed, 28 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net=
/ethernet/stmicro/stmmac/dwxgmac2.h
> index f8ab347f7b5b..3ccd29ea7ab0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -167,6 +167,11 @@
>  #define XGMAC_HW_FEATURE4		0x0000012c
>  #define XGMAC_HWFEAT_EASP		BIT(4)
>  #define XGMAC_HWFEAT_PCSEL		GENMASK(1, 0)
> +#define XGMAC_EXT_CFG0			0x140
> +#define XGMAC_EXT_CFG0_VPRE		BIT(8)
> +#define XGMAC_EXT_CFG1			0x00000144
> +#define XGMAC_CONFIG1_SAVE_EN		BIT(24)
> +#define XGMAC_CONFIG1_SPLM(v)		FIELD_PREP(GENMASK(9, 8), v)

I guess it would be better to define a mask for XGMAC_CONFIG1_SPLM.

>  #define XGMAC_MAC_DPP_FSM_INT_STATUS	0x00000150
>  #define XGMAC_MAC_FSM_CONTROL		0x00000158
>  #define XGMAC_PRTYEN			BIT(1)
> @@ -434,6 +439,7 @@
>  #define XGMAC_RDES2_L4FM		BIT(28)
>  #define XGMAC_RDES2_L3FM		BIT(27)
>  #define XGMAC_RDES2_HL			GENMASK(9, 0)
> +#define XGMAC_RDES2_NONIPHL		GENMASK(9, 2)
>  #define XGMAC_RDES3_OWN			BIT(31)
>  #define XGMAC_RDES3_CTXT		BIT(30)
>  #define XGMAC_RDES3_IOC			BIT(30)
> @@ -441,6 +447,7 @@
>  #define XGMAC_RDES3_CDA			BIT(27)
>  #define XGMAC_RDES3_RSV			BIT(26)
>  #define XGMAC_RDES3_L34T		GENMASK(23, 20)
> +#define XGMAC_RDES3_L2T			GENMASK(19, 16)
>  #define XGMAC_RDES3_ET_LT		GENMASK(19, 16)
>  #define XGMAC_L34T_IP4TCP		0x1
>  #define XGMAC_L34T_IP4UDP		0x2
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> index 6719ac6e395b..65ac5403ec58 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> @@ -292,8 +292,18 @@ static int dwxgmac2_get_rx_hash(struct dma_desc *p, =
u32 *hash,
> =20
>  static void dwxgmac2_get_rx_header_len(struct dma_desc *p, unsigned int =
*len)
>  {
> -	if (le32_to_cpu(p->des3) & XGMAC_RDES3_L34T)
> +	u32 rdes3 =3D le32_to_cpu(p->des3);
> +
> +	/* when FD=3D1 and LD=3D0, HL is RDES2[9:0] */
> +	if (!(rdes3 & XGMAC_RDES3_LD)) {
> +		*len =3D le32_to_cpu(p->des2) & XGMAC_RDES2_HL;

If XGMAC_RDES3_L34T is not defined on non-last descriptor, is it fine to us=
e it
here? IIUC XGMAC_RDES2_HL depends on XGMAC_RDES3_L34T, right?

Regards,
Lorenzo

> +		return;
> +	}
> +
> +	if (rdes3 & XGMAC_RDES3_L34T)
>  		*len =3D le32_to_cpu(p->des2) & XGMAC_RDES2_HL;
> +	else if (rdes3 & XGMAC_RDES3_L2T)
> +		*len =3D (le32_to_cpu(p->des2) & XGMAC_RDES2_NONIPHL) >> 2;
>  }
> =20
>  static void dwxgmac2_set_sec_addr(struct dma_desc *p, dma_addr_t addr, b=
ool is_valid)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers=
/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> index ff83858ebc1f..0a9c787305a4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
> @@ -561,6 +561,16 @@ static void dwxgmac2_enable_sph(struct stmmac_priv *=
priv, void __iomem *ioaddr,
>  	value |=3D XGMAC_CONFIG_HDSMS_256; /* Segment max 256 bytes */
>  	writel(value, ioaddr + XGMAC_RX_CONFIG);
> =20
> +	value =3D readl(ioaddr + XGMAC_EXT_CFG1);
> +	value |=3D XGMAC_CONFIG1_SPLM(1);
> +	value |=3D XGMAC_CONFIG1_SAVE_EN;
> +	writel(value, ioaddr + XGMAC_EXT_CFG1);
> +
> +	/* Disable variable preambles to keep the L2 split offset deterministic=
=2E */
> +	value =3D readl(ioaddr + XGMAC_EXT_CFG0);
> +	value &=3D ~XGMAC_EXT_CFG0_VPRE;
> +	writel(value, ioaddr + XGMAC_EXT_CFG0);
> +
>  	value =3D readl(ioaddr + XGMAC_DMA_CH_CONTROL(chan));
>  	if (en)
>  		value |=3D XGMAC_SPH;
> --=20
> 2.34.1
>=20

--1fVf4XHFdNIN3iOa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaro7YgAKCRA6cBh0uS2t
rGapAQDF8c4yUG8tWu9uZdll6p/lHuMxVFLaEaWwC2q9s2iUYwD9FX9szV+sTCiG
qc7P6ESar2kzpaNwY/frERSXqNcCoAI=
=py7a
-----END PGP SIGNATURE-----

--1fVf4XHFdNIN3iOa--

