Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794ACC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1nfkxoqHqtsDIrlAOueBGPUz7eK3DRzUma2WlWEGlY=; b=ukIJBpjYz+FsM1uLQApl/5QTKB
	btjHPCkjd2GJhtKQizRRLiExOl+ant/eXVhi2pOjcsp2xhTmM5c7JnLKdFBbLhJyH5r85wSLNSBqH
	Xc9EI92Ex8XZWHbtS/cSjCdcIcmdJGGqeF1KKVywiWhxN7bB+oMHcL0o1vgQqpWlw5aMmdULrWOa9
	EwsD29e1TOKGnn1lAnSRuZ6o3NrF1pV5Tka6gcGuLu4qv7kNaCQ9abF+Pgv1HGJNuIh5rs0JSSJsA
	DgDnjdRqsRMA2OQqHEKGBc6o+nNLCY5unoPHZHwsmhUn3sofWW7HwdPLYqpS/05a3YhUyJ1I0FFWL
	wZFJuwPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Vp4-00000002WXZ-0UtN;
	Fri, 04 Sep 2026 15:27:22 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Vp1-00000002WWt-2zbY;
	Fri, 04 Sep 2026 15:27:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C0FB44E41511;
	Fri,  4 Sep 2026 15:27:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93BBE6057F;
	Fri,  4 Sep 2026 15:27:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C349711C79A0A;
	Fri,  4 Sep 2026 17:27:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788535636; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=N1nfkxoqHqtsDIrlAOueBGPUz7eK3DRzUma2WlWEGlY=;
	b=RzxnD/IpiHfYHW8Y4IF9QDaStVQ5scVKGIR6fIbFHUu8oMt2/2KyH5RdGRIhq0wR0uhahF
	Mc15SmDirQDEVKxEk9XdxLyCuxjZW76fH7KryOI04ovbiDdLlW7u1kKU5iVHVbt7Sf9Okp
	9uEgl4dKhuuEBbvBTvg0ijybhm9odnMK+R74rbdsGjGYVbh6ghWvRTu/JUO4mMdY5Zsplx
	1pclSnSH5DOhyKqyQXxODoIsu/HqFAJgWzrSMv0INoDFw4Ptcjy6E2L+IgrKvuJ/RKNzi3
	TKWZhwXr9HChSTW+O97kVgt91eyfh5RfmxFkytingVInkm9XdhhuhI2eHzW07g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Maxime Ripard <mripard@kernel.org>,
  linux-mtd@lists.infradead.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-sunxi@lists.linux.dev,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: rawnand: sunxi: support randomized OOB formats
In-Reply-To: <CADvTj4oW8Hxv_b5vWM5pbeB3wEO-WoqhLwyinCTFPNR6wTHYmQ@mail.gmail.com>
	(James Hilliard's message of "Fri, 4 Sep 2026 11:17:46 -0400")
References: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
	<20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-2-463853a14ad9@gmail.com>
	<87se3p13jy.fsf@bootlin.com>
	<CADvTj4oW8Hxv_b5vWM5pbeB3wEO-WoqhLwyinCTFPNR6wTHYmQ@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 04 Sep 2026 17:27:13 +0200
Message-ID: <878q5h11gu.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_082719_888113_0702118F 
X-CRM114-Status: GOOD (  16.11  )
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

On 04/09/2026 at 11:17:46 -04, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> On Fri, Sep 4, 2026 at 8:42=E2=80=AFAM Miquel Raynal <miquel.raynal@bootl=
in.com> wrote:
>>
>> On 10/08/2026 at 17:04:50 -06, James Hilliard <james.hilliard1@gmail.com=
> wrote:
>>
>> > The controller randomizer covers the bad block marker along with the
>> > rest of the OOB data. The driver currently compensates the marker bytes
>> > before writes and after reads so that they remain plain on flash.
>> >
>> > Allwinner NAND firmware instead stores the marker through the
>> > randomizer. Media using that format appears to contain bad blocks unle=
ss
>> > the randomizer is enabled while reading the marker.
>> >
>> > Honor the allwinner,randomized-oob property by unconditionally enabling
>> > page scrambling and leaving the marker in the randomizer data stream.
>> > Keep the existing plain marker behavior when the property is absent.
>> > This changes marker handling on all supported controllers; the H6/H616
>> > protected user-data placement is handled separately.
>>
>> But I think the reason why this has never been done is because it just
>> breaks raw accesses, including the BBT reads. I don't think this is
>> handled, is it?
>
> From my understanding raw access bypasses randomization entirely.

yes, so the implementation you propose is invalid, raw reads shall
show the BBM. And also, when accessing a BBT, it is made in raw mode,
without randomization, and hence totally fail. This cannot fly!


