Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4501C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 10:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fk38717sRf84XA5nxcFuMZclfSN0BjsWFn3l9+IPIps=; b=2ytqwlenKefgGVZSQESZxRT8AL
	R7d1bUw3WbjI9n3cDnaQdJJQVnZVxEpxQPN/I/37wOOvH1TUvWcJNx8Xt8o4/FvLF1GVboROgd/mH
	hYp73NuIZARJuTFr+AmeQLFnLbxTtNjftA6dVsdl24kqdL6utzAkel8R0472zMhG14KDURBBchzxN
	OBnXqPEgi177yZCfA9ST/33ffqmRZrXrwV4t1yv/a67gy6pUYAS+v5K4WmptsFmhgR1iYIRZkRSPc
	bYf1mpkFmmwdXqv3PARtLpTPJuNeD5aUhIy972H/xhxqcisd8HwftLnDhkHepT9H9uQmejHmi+qm6
	48AlJCnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wupUi-00000002Y4U-1vkW;
	Fri, 14 Aug 2026 10:50:36 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wupUf-00000002Y3x-0JYI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 10:50:34 +0000
Received: by chaosmail.tech (Postfix) id BDFDB1CBF47;
	Fri, 14 Aug 2026 10:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786704626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fk38717sRf84XA5nxcFuMZclfSN0BjsWFn3l9+IPIps=;
	b=J/cmatlaL96OZq6oL/hOX49S3xwsUqOYZBrGcwau9Ovvlqw9+/OBW5EkScIL6EscA2u0pN
	tGYPwEVJg/VDJcWz2CNxzoweveWb4KwPmgE485k7KlhudINXmJ8+3qBrO07JeL3G0Rsye5
	BnttChsmbWGE+e8F3bn8e8js0Xmuy3c=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/3] usb: typec: tipd: Factor out i2c specifics
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <an7lj2g1bAkOZw-o@black.igk.intel.com>
Date: Fri, 14 Aug 2026 12:50:15 +0200
Cc: Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Alyssa Milburn <amilburn@zall.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CA6513E7-9CAD-4EA1-AFE9-092A0D7C905C@chaosmail.tech>
References: <20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech>
 <20260806-tipd-ace3-v4-2-79855b150914@chaosmail.tech>
 <an7lj2g1bAkOZw-o@black.igk.intel.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_035033_570458_504F08EF 
X-CRM114-Status: UNSURE (   5.89  )
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

On Aug 14, 2026, at 11:53, Heikki Krogerus =
<heikki.krogerus@linux.intel.com> wrote:
>=20
> How about:
>=20
>        int tipd_init(struct tps6598x *tps, enum tipd_hw_variant =
variant);

I am not sure what this gets us. The tipd_data is already needed before
calling tipd_init, as it contains tps_struct_size.



