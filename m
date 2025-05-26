Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA24C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 08:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5ar1+ii+EEJg36aGo+is3ncJ1EKGEqq8suROqpajvc=; b=erOFmqtTwtz/rQcOX14RQlqmUl
	oIgqbestRgUp6Q3lzI7U83PwOPk8j7tEd2RlEKAcNyjnXr3hClKNhXHJh/G72IXHVHKwMZxy89Gpi
	x9T5BYFrpcoijkkkRb2es+v4BCqbwVmyuIyAPeJ5Sr/nSTxBUkK8auDYNqynP+qCP75Vf3hl0ySjQ
	ct2VxV1zSs/MMWo6L6P8xe6Y1n4a5AJPxZEoQEzEcBHWYlPytwFSQNEyCu5B+VlznXoF65PFF8vj9
	5UwiHryONdWuYg6cjVzSU4IuAvh4uwxAucpz7HsVeWrrA0vm7EUO5nGEKpEsl2Deg2k95VwL9idkX
	Lf8Gbz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSya-00000008MVT-2KdM;
	Mon, 26 May 2025 08:14:28 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJSwR-00000008LzI-0NaD;
	Mon, 26 May 2025 08:12:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B610342DFF;
	Mon, 26 May 2025 08:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748247132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h5ar1+ii+EEJg36aGo+is3ncJ1EKGEqq8suROqpajvc=;
	b=VALR+SSJ/mrK8uubAwfd02c0E4HinwQa3Fr7aSxh2mvFGRSNLT7oirBd3JBdl0XvI/I3ve
	2evkgdxzo/ok6EblNKPz8JAivojF0jfEoOaHHvsMM6gZ153NrNmis2Ih6WYiek0TF5Obk+
	9Osx6wN9VUphURRJ1Y0YBs+5kC2/gCXZyT5BVBSyqp1uqRTk0iB4Ix+CzG46DN6W6+1InP
	O/E8XOVgCJHzfMfIRQJvTkNMbod2JDgssODpznMUBg0438gMUwyOx5HZpNRqEXcs45lSht
	A4OsIziIr6c12taUyHJIck7wOISnWiIipl9sk0JfPb9p5UghhjUj5t2KZkckcA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: richard@nod.at,  vigneshr@ti.com,  wens@csie.org,
  jernej.skrabec@gmail.com,  samuel@sholland.org,  ruanjinjie@huawei.com,
  u.kleine-koenig@baylibre.com,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  stable@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: sunxi: Add randomizer configuration in
 sunxi_nfc_hw_ecc_write_chunk
In-Reply-To: <20250526034344.517-1-vulab@iscas.ac.cn> (Wentao Liang's message
	of "Mon, 26 May 2025 11:43:44 +0800")
References: <20250526034344.517-1-vulab@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 26 May 2025 10:12:09 +0200
Message-ID: <8734cr3i5i.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujedttdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopehvuhhlrggssehishgtrghsrdgrtgdrtghnpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepvhhighhnvghshhhrsehtihdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgrmhhuvghlsehshhholhhlrghnugdrohhrghdprhgtphhtthhop
 ehruhgrnhhjihhnjhhivgeshhhurgifvghirdgtohhmpdhrtghpthhtohepuhdrkhhlvghinhgvqdhkohgvnhhighessggrhihlihgsrhgvrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_011215_259860_280C785B 
X-CRM114-Status: GOOD (  13.11  )
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

Hi Liang,

On 26/05/2025 at 11:43:44 +08, Wentao Liang <vulab@iscas.ac.cn> wrote:

> The function sunxi_nfc_hw_ecc_write_chunk() calls the
> sunxi_nfc_hw_ecc_write_chunk(), but does not call the configuration
> function sunxi_nfc_randomizer_config(). Consequently, the randomization
> might not conduct correctly, which will affect the lifespan of NAND flash.
> A proper implementation can be found in sunxi_nfc_hw_ecc_write_page_dma().
>
> Add the sunxi_nfc_randomizer_config() to config randomizer.
>
> Fixes: 4be4e03efc7f ("mtd: nand: sunxi: add randomizer support")
> Cc: stable@vger.kernel.org # v4.6
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/mtd/nand/raw/sunxi_nand.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sun=
xi_nand.c
> index 9179719f639e..162cd5f4f234 100644
> --- a/drivers/mtd/nand/raw/sunxi_nand.c
> +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> @@ -1050,6 +1050,7 @@ static int sunxi_nfc_hw_ecc_write_chunk(struct nand=
_chip *nand,
>  	if (ret)
>  		return ret;
>=20=20
> +	sunxi_nfc_randomizer_config(nand, page, false);
>  	sunxi_nfc_randomizer_enable(nand);
>  	sunxi_nfc_hw_ecc_set_prot_oob_bytes(nand, oob, 0, bbm, page);

Please next time send all these "identical" changes in a single patch.

Cheers,
Miqu=C3=A8l


