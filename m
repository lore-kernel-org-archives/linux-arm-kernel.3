Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9724E606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 10:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IG06LWOr;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h3W+6QOQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AjOm5itLLaZPzR/tAo6X/hh5/JJzIWsiJUfZJmio3GM=; b=IG06LWOrujJdIa
	UmiS0yP7GS/MIWyP+fsb8bGVDUOvIWHD/GQANGjPMMH2FT7UDBb/mvvdmQks3E2bBGg/kEvQhM6Tt
	VotF0dFfVXgzIoIZu8SkqYp0g4bsLCsB4d96MPvOM8XSeesN6w1BSo22QobkxHHinigKl6M+vBEz6
	v3GlS/2WTx+xEMdV9mlLNgN9leAXadZtgvhDX9UawWuKTjmpxjCBFwEVFVrfG42vBaZejlyTUyZD2
	R8N8cTBHnjJNX5x4wswmZHYuX9ixoe7wsfcbhaUlMEpLofiyrv0K4aVP5jY1rWeCPPJwK+VApRFGE
	6L+XT0zC7eOOpANu7CnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTGW-0000000E6wJ-1YqH;
	Sun, 01 Nov 2026 10:58:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTGV-0000000E6vz-0VUi;
	Sun, 01 Nov 2026 10:58:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C318600E2;
	Sun,  1 Nov 2026 10:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFCB1F000C1;
	Sun,  1 Nov 2026 10:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530697;
	bh=AjOm5itLLaZPzR/tAo6X/hh5/JJzIWsiJUfZJmio3GM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=h3W+6QOQFcZc8oDCXkmzOOvczCIlomQUSyFaW86UyrATsUVayqop5U9DYtTNpgLYl
	 0GwSJSUECuWJNBAEiTElAT8DxKzlbu+QD4qIVVAeOIaRu0RDsPBJSbNYdp4T/ixyW8
	 11hNt2t8sQwVbGLJAUhf7tCOkcMTRWqAzKw8IElHpPlglQzcDC519pYufEZTdDecj5
	 nb78H9KBLdorKKLWyJaEtcppiqc6lBJDR/4Zs5pKKlQZ519d2XGskB3OYbZVKS7KHC
	 wHL87gmzU+5C6maivErEBNTUJuC36gZC67Wd3gWGZkFYTDTW4JuRV71KbvHOkIjxnT
	 5ONB1dFCWfoog==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v18 1/7] phy: rockchip: usbdp: Track PHY power state
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-1-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <20261021-b4-rockchip-dwc3-rockchip-glue-v18-1-60000d03fca2@collabora.com>
Date: Sun, 01 Nov 2026 16:28:11 +0530
Message-Id: <179353069145.2955.17636062800413643927.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=347; i=mani@kernel.org;
 h=from:subject:message-id; bh=/Xjc4dd3Kn79T6DBExQzfzf3GV15xNS3edAbpVBalow=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xtFkLHGHY4Dte8tp134lDqaZDFBOFkH/LshI
 aNzuR6MJbOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucbRQAKCRBVnxHm/pHO
 9YcPB/91VG4aHMmJm8c5BSrj/2Xm5CnNIPpgo+RDCVAjvwcxgZHkFiZchWJYqHiQkYrOzz+GaBK
 ww7Kt2ghLx9mYTOlukkGgWJCkIwZ0WR3BV+/tKUDhrkoSd2w3ZnaUwwChxXo5QAnvhxPALJYdGh
 Fz6RTAYgBTwUt63C0+me+H/eHO3YEQytHJuFOjqKhiHitY/npIGlJdf/wNHMePklLcUmzLY42UF
 Pd/ETjFa9Lvlcs0JaPOzk7eYddtKYLLBKox6nLLPWEDvBjqzVlDiKOxEofw/N1ISBI6/qXO605H
 143Tw6SaKVNhCGV7BRYx1XALDZ6qIRh9KfKAzBoVBEET6/Jm
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-21 20:05 +0200, Sebastian Reichel wrote:
> Track PHY state requested by software for DP and USB3 individually
> in preparation to rework and fix up power state handling.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



