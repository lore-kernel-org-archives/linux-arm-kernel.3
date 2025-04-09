Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E03C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZcboPvUR5IHm0tuhCfo0KhbP/W6yUMqtAc0Ziq24U7U=; b=aVflCnVRn9VcC4tq3It/v78kuT
	AQXkRBjlFB8FGkQjQhaQ4mSegS7rF8M7V21Me3YGUCK7b2HW8unv4uch6VN3FiTLRaUQYfo1z4O4f
	eZkK3FUD7EEVWBCXrRxLQBZ4pweOjKSV7yF2OzAPbrIaR/CQ7mo+6U3hQcTJMZS5eudMeB6cDwEXy
	RWwc+6Edv1WIvwZpuLxtNqOQaIpYD3qE1Q/tFtCFR+zDXLa7wx80eCEyY3MDlHpKC+bkqCn2BP7j3
	lva/BibBSEzLcoJbZHco3w4q6uVZduYcvY4EHSQXX6elu3U3UARmrjBzI3PUx8CissXWl7FWJauRV
	dtqDFOAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TsG-000000072oE-1F48;
	Wed, 09 Apr 2025 11:45:44 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TqT-000000072Qz-0Bar
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 11:43:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1744199024; x=1744803824; i=markus.elfring@web.de;
	bh=ZcboPvUR5IHm0tuhCfo0KhbP/W6yUMqtAc0Ziq24U7U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HHQyIUCH2tXvFr1A9+pq3qpGYQJ58DNhx0SvwG3ZcnAQEInuolYwItp6q8aHQxVg
	 9hEl7g83CAsnsLDxLy4+Zgi4Df4Y52kd3Zpx0PZyPYXvqp795SEd0YmCe7oLPBHv9
	 tgO0IAfSBqan6RYKvkp6oSpmviw4XgDD2c7l4cjiEt6HqZsTNIgBRPMOlR0+9NBJ2
	 RUBPJuCX1DNTjQklZjsYcrc3H1fgU3BMzSgGUGMjgYqHkF8acEhUTCZgapXHaL+Ha
	 2tUxHRSJmhrGhnVHowTMdo1uRY1wpnvW7olHQU6ik0AW+4o3dsQsObvMtINTV7Alf
	 pX6+q01rCHUk9xptsQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.27]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N30dV-1t4LfG3KqT-00xgZ1; Wed, 09
 Apr 2025 13:43:43 +0200
Message-ID: <3727de04-7993-4b81-80c0-adb40b847307@web.de>
Date: Wed, 9 Apr 2025 13:43:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-sunxi@lists.linux.dev, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Andre Przywara
 <andre.przywara@arm.com>, Chen-Yu Tsai <wens@csie.org>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@inria.fr>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] crypto: sun8i-ce-hash - Refine exception handling in
 sun8i_ce_hash_run()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jEGNiMKs8nAQw2qIQjUCQq/KWOsVvdlxMimxs5ulT7dkC8Jy8vn
 sjvXtDkHx1NdmMR2lfMzvk9aLWGt6cUsQAf4s4emy/sWUqdg3UOLtEjqk17QN47SO7dFcJb
 AXUoI3lNiWi1QxGCvZBv3C1zvrsuJNDxfKbgyudePrBW8wI9qmNQ4IeqhC27tyOSa3ZpB6i
 1sbNZMcwz1m1/XdJa+Dgw==
UI-OutboundReport: notjunk:1;M01:P0:xNwPz1kyRa4=;mhac4w7rrkZIUH0v2PZOyYFCNiY
 JyzmGclW/6PQvJJ45Nz42p+6+B9uGh+XKN1ZwSDZpqjHJ5OimogrHASfjWlyFI14Hh0YYUOol
 ZkUJknhX4uAv5J+cFMubYlTZGUG/Bo++ZnvSGmGnF70rAcMsxeAMHcAVrBD8L2ujzwCsu8Nqe
 4JB3h+oEyfqn9FfS5GOfCXVPcf4+EDFGoQ8QvUd+qjCzbD0dtLan5W5QV7m8loLKGao52gnhI
 FPfJYsA++FkB+UbSCAlBRw7Xm+gZv01E7L3fPOLV/2lrIhXxhNjiGO3svor4dTetQW5vXW5HR
 8fTBaqSwwVxuFLK/1bACOSrkbyo8WTEoeUzI8GZHaui31Z/XXFBKUzdEody1ymjEVGlMDdTrB
 epPne+q0z0xzaIWBJyBAIjZFBYogkQZ4dxc5BdI4kdH5keHGGptYQlAoLBChZhWrQQ/uhUJK8
 TzxmOn/KSiIhwLOUUo/mG1bh9emuXe14PRzcl/nugKDccjefIYJ+0Dq8+/gKyvKyXXRGZyD1q
 okI2wmDTI3VGUiHjZQI0fjdleH1QJqkR9B986Mu1aw+3DMv2czXTuMI8Ac7+63pJxuK/RWys/
 MQzG9ZhH6fx8HNTraJBRgH3J006Tze/vLmPqGhZjdGIqhANJPp+I8IuMLQju9yme3Y4wCQ3WZ
 qOR2embihPCMKfrba+MTqjHe5FOLEXqgyeRFRL3isO0gPaQAiHNZ8Klk5PlgMIrRGS509nvFM
 I+5enqjNqKWdUcj9AjZRG20o+4d8hKYJBRS0UVCrscp44yGgG8aW2M5BlWk9faqnicr7Kz1tS
 J2QbvRCUcAr2DBHu82vCmCbhWeL8dvRRzOIYc/Ljoya4rNX3A9EG8sbvcccOhLyth3mS29lIl
 08m+rEr/FPMIuI/GKUqALXQpa2tlbFMizemDSUJ3dNUsgwhiXZ57OtlZRx582WVHUUyxjEb4u
 3Oe6kQvxD/soNWmJC2ESsC6OzZWcIPvqfwXlEzkUcw8K1gJxGcg1Lq0vfxCFeiq3vEMDCNv7l
 4R3tkXylq+wgilTD8HgWiKsGtM3rRPufDeD3jKunDbAwhQMDeOpcGeCjAb7YuixPJzGru9m5Y
 l1hVZfZvuNN6tjfgEljjut8M49BAwGWByQ6uWpkk2yGySY+82oOo8otShveK2kS38P5GzsRFx
 2i1/j2BzovByq9gGjlz5llgCv92MpDkwPpt9QkzA2J7/baSD1tcoVPSVbfwqRYRVZpIJLs6Gr
 cHtSBZikXE8fIQC2liW+EtsF+sALU5F5FMujb4W3+pqqrQakTozhzTUrvwIeWKixNi+VGuxc+
 YYxy35wkU0EPEoMUeji3co3tbLllbFWCeGWyUQis0S8lxv0NXhThkW59OqfliT9sn217/IJxN
 kRxcwoW+UFf+a44sfTstf4N36E1XsLqTFkxemtsKQ/gej5PECPnTs2a20VBDGZuVWqlTstS/J
 fz61JGNz42bJBhKTE7MNA9yRm6vdHnT4o9Yi9lW3tCK44ZDyt4SnI2F3fValD3iGEAf0ewnUA
 l5CXOLI5PhcXDfZoi08=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_044353_465127_4AAB9D5C 
X-CRM114-Status: UNSURE (   8.72  )
X-CRM114-Notice: Please train this message.
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 9 Apr 2025 13:26:55 +0200

Two if branches contained duplicate source code.
Thus avoid the specification of repeated error code assignments by using
additional labels instead.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/c=
rypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index ba13fb75c05d..7d31e190bb6a 100644
=2D-- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -399,14 +399,14 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, =
void *breq)
 	}
 	if (len > 0) {
 		dev_err(ce->dev, "remaining len %d\n", len);
-		err =3D -EINVAL;
-		goto err_unmap_src;
+		goto e_inval_src;
 	}
 	addr_res =3D dma_map_single(ce->dev, result, digestsize, DMA_FROM_DEVICE=
);
 	cet->t_dst[0].addr =3D desc_addr_val_le32(ce, addr_res);
 	cet->t_dst[0].len =3D cpu_to_le32(digestsize / 4);
 	if (dma_mapping_error(ce->dev, addr_res)) {
 		dev_err(ce->dev, "DMA map dest\n");
+e_inval_src:
 		err =3D -EINVAL;
 		goto err_unmap_src;
 	}
@@ -428,16 +428,15 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, =
void *breq)
 		j =3D hash_pad(bf, 2 * bs, j, byte_count, false, bs);
 		break;
 	}
-	if (!j) {
-		err =3D -EINVAL;
-		goto err_unmap_result;
-	}
+	if (!j)
+		goto e_inval_result;

 	addr_pad =3D dma_map_single(ce->dev, buf, j * 4, DMA_TO_DEVICE);
 	cet->t_src[i].addr =3D desc_addr_val_le32(ce, addr_pad);
 	cet->t_src[i].len =3D cpu_to_le32(j);
 	if (dma_mapping_error(ce->dev, addr_pad)) {
 		dev_err(ce->dev, "DMA error on padding SG\n");
+e_inval_result:
 		err =3D -EINVAL;
 		goto err_unmap_result;
 	}
=2D-
2.49.0


