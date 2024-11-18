Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4582FD49222
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CgitSO12Tcu39jjcYc9b4qcvZmSoxQsq/VM/TY8Chgw=; b=uXPl+RH4vQt2Jw8OH361D7Qlo4
	039lCa73AlRzSuodEpuQMJYyvwe6srCwZUHMUHiz94y9un87x1tWRWrMNEh13icEYORI3xtO8XpJK
	tDtXpQMOZGyqS9BiprtSL+9Tv08j5IRq+WWGhA08R/bSRKqtJk9ESjPk/jRIF01JJWfNP/cmbZOwH
	oEKLqKmMiFjvwvaeK8KFC12lvzCRU3vOsoO9o4DxV+5yf4/r5YmmLdsznBjqQgEKdiQC82BB+t1Dt
	goHyGIOz0211AVXn4kBaO/xJ0VWkikAV2dyUOsehB6HkxX9aGD4ND7xCb2g6zG+kPDztz3K8BSR3m
	PrCivKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1qd-00000009aR1-2djl;
	Mon, 18 Nov 2024 13:31:23 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1SI-00000009Un1-1pVy;
	Mon, 18 Nov 2024 13:06:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D80FEFF806;
	Mon, 18 Nov 2024 13:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731935172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CgitSO12Tcu39jjcYc9b4qcvZmSoxQsq/VM/TY8Chgw=;
	b=aKvYvzsMXQQ+ls8zRUxnMN6GkySr1qXCFabheMfnb2re1dpmlDRs93dxj9kRjTynCcg02/
	1lc4TLcQyEjdG3NW5kg5VBTiF1fQvkygHr6+KILeTA2Wnlol83xPMKVD9p4hwtueAlHR2k
	pJrl8oMnVn2K+jZXZEpETa0cG/fnJbFRbaxFDDXPlvfikQsC0lKc4EH+U0Ogv3HOAOL0Fh
	plKibB+fHaASv3ksfyfd2T3Z/6Nw9sJOzKVLdL0pr0wdQ6LGnzKINLswMe6BBtwk0cFd9M
	i0i/AMm4tNZjYt2Sz915at6l1cB72cQgMnfWgm6vfcxTI4IIDYnmMYJHaFZcuA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,  Daniel Golle
 <daniel@makrotopia.org>,  Chia-Lin Kao <acelan.kao@canonical.com>,  "Mika
 Westerberg" <mika.westerberg@linux.intel.com>,  Cheng Ming Lin
 <chengminglin@mxic.com.tw>,  <linux-kernel@vger.kernel.org>,
  <linux-mtd@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,
  <linux-mediatek@lists.infradead.org>,  Steven Liu
 <Steven.Liu@mediatek.com>
Subject: Re: [RFC PATCH nand/next 3/4] include: mtd: spinand: Add CASN page
 related macros and flags.
In-Reply-To: <20241020132722.20565-4-SkyLake.Huang@mediatek.com> (Sky Huang's
	message of "Sun, 20 Oct 2024 21:27:21 +0800")
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
	<20241020132722.20565-4-SkyLake.Huang@mediatek.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 14:06:08 +0100
Message-ID: <87r078y9mn.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_050614_908658_323E61CB 
X-CRM114-Status: GOOD (  21.08  )
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

On 20/10/2024 at 21:27:21 +08, Sky Huang <SkyLake.Huang@mediatek.com> wrote:

> From: "Sky Huang" <skylake.huang@mediatek.com>
>
> This patch adds SPINAND CASN page manipulation macros for
> SPI-NAND driver to use. Also, some important flag bits, like
> SPINAND_SUPR_CR(continuous read), are added to show the
> SPI-NAND device's capability.
>
> Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
> ---
>  include/linux/mtd/spinand.h | 100 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 98 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
> index 702e5fb13dae..de97994c357b 100644
> --- a/include/linux/mtd/spinand.h
> +++ b/include/linux/mtd/spinand.h
> @@ -62,6 +62,59 @@
>  		   SPI_MEM_OP_NO_DUMMY,					\
>  		   SPI_MEM_OP_NO_DATA)
>=20=20
> +/* Macros for CASN */
> +#define SPINAND_CASN_PAGE_READ_FROM_CACHE_OP(fast, naddr, addr, ndummy, =
buf, len) \
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(fast ? 0x0b : 0x03, 1),		\
> +		   SPI_MEM_OP_ADDR(naddr, addr, 1),			\
> +		   SPI_MEM_OP_DUMMY(ndummy, 1),			\
> +		   SPI_MEM_OP_DATA_IN(len, buf, 1))
> +
> +#define SPINAND_CASN_PAGE_READ_FROM_CACHE_X2_OP(naddr, addr, ndummy, buf=
, len)	\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),			\
> +		   SPI_MEM_OP_ADDR(naddr, addr, 1),			\
> +		   SPI_MEM_OP_DUMMY(ndummy, 1),			\
> +		   SPI_MEM_OP_DATA_IN(len, buf, 2))
> +
> +#define SPINAND_CASN_PAGE_READ_FROM_CACHE_DUALIO_OP(naddr, addr, ndummy,=
 buf, len)	\
> +		SPI_MEM_OP(SPI_MEM_OP_CMD(0xbb, 1),			\
> +			   SPI_MEM_OP_ADDR(naddr, addr, 2),			\
> +			   SPI_MEM_OP_DUMMY(ndummy, 2),			\
> +			   SPI_MEM_OP_DATA_IN(len, buf, 2))
> +
> +#define SPINAND_CASN_PAGE_READ_FROM_CACHE_X4_OP(naddr, addr, ndummy, buf=
, len)	\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0x6b, 1),				\
> +		   SPI_MEM_OP_ADDR(naddr, addr, 1),				\
> +		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
> +		   SPI_MEM_OP_DATA_IN(len, buf, 4))
> +
> +#define SPINAND_CASN_PAGE_READ_FROM_CACHE_QUADIO_OP(naddr, addr, ndummy,=
 buf, len)	\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(0xeb, 1),				\
> +		   SPI_MEM_OP_ADDR(naddr, addr, 4),				\
> +		   SPI_MEM_OP_DUMMY(ndummy, 4),				\
> +		   SPI_MEM_OP_DATA_IN(len, buf, 4))
> +
> +#define SPINAND_CASN_PROG_LOAD(reset, naddr, addr, buf, len)			\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(reset ? 0x02 : 0x84, 1),		\
> +		   SPI_MEM_OP_ADDR(naddr, addr, 1),				\
> +		   SPI_MEM_OP_NO_DUMMY,					\
> +		   SPI_MEM_OP_DATA_OUT(len, buf, 1))
> +
> +#define SPINAND_CASN_PROG_LOAD_X4(reset, naddr, addr, buf, len)			\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(reset ? 0x32 : 0x34, 1),		\
> +		   SPI_MEM_OP_ADDR(naddr, addr, 1),				\
> +		   SPI_MEM_OP_NO_DUMMY,					\
> +		   SPI_MEM_OP_DATA_OUT(len, buf, 4))

Why would you need to redefine all these?

> +
> +#define SPINAND_CASN_ADVECC_OP(casn_adv_ecc_status, buf)			\
> +	SPI_MEM_OP(SPI_MEM_OP_CMD(casn_adv_ecc_status.cmd, 1),			\
> +		   SPI_MEM_OP_ADDR(casn_adv_ecc_status.addr_nbytes,		\
> +				   casn_adv_ecc_status.addr,			\
> +				   casn_adv_ecc_status.addr_buswidth),		\
> +		   SPI_MEM_OP_DUMMY(casn_adv_ecc_status.dummy_nbytes,		\
> +				    casn_adv_ecc_status.dummy_buswidth),	\
> +		   SPI_MEM_OP_DATA_IN(casn_adv_ecc_status.status_nbytes, buf, 1))
> +/* Macros for CASN end */
> +
>  #define SPINAND_PAGE_READ_FROM_CACHE_OP(fast, addr, ndummy, buf, len)	\
>  	SPI_MEM_OP(SPI_MEM_OP_CMD(fast ? 0x0b : 0x03, 1),		\
>  		   SPI_MEM_OP_ADDR(2, addr, 1),				\
> @@ -312,8 +365,11 @@ struct spinand_ecc_info {
>=20=20
>  #define SPINAND_HAS_QE_BIT		BIT(0)
>  #define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
> -#define SPINAND_HAS_PROG_PLANE_SELECT_BIT		BIT(2)
> -#define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)

Why do you remove that?

> +#define SPINAND_SUP_CR			BIT(2)
> +#define SPINAND_SUP_ON_DIE_ECC		BIT(3)
> +#define SPINAND_SUP_LEGACY_ECC_STATUS	BIT(4)
> +#define SPINAND_SUP_ADV_ECC_STATUS	BIT(5)
> +#define SPINAND_ECC_PARITY_READABLE	BIT(6)
>=20=20
>  /**
>   * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine st=
ructure
> @@ -406,6 +462,28 @@ struct spinand_dirmap {
>  	struct spi_mem_dirmap_desc *rdesc_ecc;
>  };
>=20=20
> +/**
> + * struct CASN_ADVECC - CASN's advanced ECC description
> + * @cmd: Command to access SPI-NAND on-chip ECC status registers
> + * @mask: Mask to access SPI-NAND on-chip ECC status registers.
> + *	  ADV_ECC_STATUS->status_nbytes | CASN_ADVECC->mask
> + *			1		|      0 to 0xff
> + *			2		|     0 to 0xffff
> + * @shift: How many bits to shift to get on-chip ECC status
> + * @pre_op: This comes from CASN page's ADV_ECC_STATUS's pre_op.
> + *	    After reading on-chip ECC status, we need to do some math
> + *	    operations if this is specified.

I'm not sure I understand how you'll encode a math operation there.

> + * @pre_mask: This comes from CASN page's ADV_ECC_STATUS's pre_mask.
> + *	      This is used in companion with pre_op above.
> + */
> +struct CASN_ADVECC {

This is usually changing when continuous reads are enabled, it would
need to be handled.

> +	u8 cmd;
> +	u16 mask;
> +	u8 shift;
> +	u8 pre_op;
> +	u8 pre_mask;
> +};
> +

Thanks,
Miqu=C3=A8l


