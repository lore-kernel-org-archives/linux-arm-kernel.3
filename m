Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD4DEE4990
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VcsRDU8rlvK3l3KStHQGwiMcU7pfsmF2k+0fJUQSUDI=; b=WibsjDhicYvQak7UdnsA13RTbc
	TrVnaDfCCaWlj2F5P3bN0momu6eXIzSY32uLHVy8KGTbZ+Em3sJe+9an7+0P1okGC3k24Pq8bxYyU
	jLEyZD4Rl1dPhgHS0Pkgehl2/lCuAYogqy8mUCwE73lMWoVxVuJT7sgC0OMPl1pm61NpNj5MMEEMX
	9eRdeR8qplfw1rjF9rCKYceZwhLAf5Ek9vTffJL9YVQfYcZq09WM5ieJumRgVkmOjVfZuugNgOIO2
	oZgvWGOIfbqAC6GBauG3gxQqyoLGo8bgRcVgZplzuxyIcHoo5h5ICFHc5DFPuMAXjQEAqwBMBhEhw
	I+PWpl/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vae6q-00000005A9d-1P4k;
	Tue, 30 Dec 2025 18:06:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vae6m-00000005A9L-1tsz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Dec 2025 18:06:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B72140DD0;
	Tue, 30 Dec 2025 18:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DA0C4CEFB;
	Tue, 30 Dec 2025 18:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767117970;
	bh=d56dgI6Y5PdhNqTXDppdPpaYunnHYAw+cp/8Lv9TnIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LdP5RAlZVwfui6ATS7o6Q1TU6zwgdzyBneXEku3UUjhcew8CcIMDuW91se2EYAB2w
	 KoTu1wvAY6xPblQ7lL70pVSG+HZcqZTkmVO7BTONVuss2b7R15Dtv/REXIQmOSKvwi
	 HzIPNGELsRJ3r1NmPshi4izd7YUCNWKWuUHDd6Om6HnyXyO01tyS0b2SlMfxy6oCHW
	 TK8/VCAagei4yvhmcJAsMlkZa/yJqmHcAw9vhbq939v4GFmOd3wASmZmD6ArSDzIAh
	 WVHQyMQUdKYzLY12Z13eIvwfw76BEb7sx9hcRQuAbn/CJI49FTMJT32dVc6o3uLw9P
	 Ws5JJMFAPTSGA==
Date: Tue, 30 Dec 2025 12:06:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: herbert@gondor.apana.org.au, Steen.Hegelund@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, kuba@kernel.org,
	linux-i2c@vger.kernel.org, lee@kernel.org,
	linux-crypto@vger.kernel.org, jirislaby@kernel.org,
	andrew+netdev@lunn.ch, dmaengine@vger.kernel.org,
	andi.shyti@kernel.org, linux-gpio@vger.kernel.org,
	pabeni@redhat.com, gregkh@linuxfoundation.org, davem@davemloft.net,
	luka.perkov@sartura.hr, vkoul@kernel.org,
	UNGLinuxDriver@microchip.com, radu_nicolae.pirea@upb.ro,
	daniel.machon@microchip.com, richard.genoud@bootlin.com,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org,
	lars.povlsen@microchip.com, linux-kernel@vger.kernel.org,
	broonie@kernel.org, linusw@kernel.org, edumazet@google.com,
	olivia@selenic.com
Subject: Re: [PATCH v4 01/15] dt-bindings: usb: Add Microchip LAN969x support
Message-ID: <176711796888.884073.12938472533739359591.robh@kernel.org>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
 <20251229184004.571837-2-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229184004.571837-2-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_100612_510417_821ECE01 
X-CRM114-Status: UNSURE (   9.40  )
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


On Mon, 29 Dec 2025 19:37:42 +0100, Robert Marko wrote:
> Microchip LAN969x has DWC3 compatible controller, though limited to 2.0(HS)
> speed, so document it.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes in v2:
> * Fix example indentation
> 
>  .../bindings/usb/microchip,lan9691-dwc3.yaml  | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


