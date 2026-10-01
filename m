Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02E3CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 06:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmUdotlXBym7+M7DTZqezt6CY+s7rUVFUXVNY2HpXtE=; b=NcWXxENyrIWEMqxPReOjzsz0G9
	DOlWsmfzhZnozJAUU5WW2kbQaVzog4EVRtpjaZ1JxXtYuEqOg77PhvBfXn8J8yX0MfOE8W8/zToxy
	S8S83oGT0E+tquyJQdv7nUQkT1BDsYUtF/CY3OSujvwokI7EpCdczOvc0k53VkUfxUfcbwFLAbk60
	1S0+g4uC58b3PSkikV/LJ1qB/7vH6XTHWwL0iFpPWyGpJqjp6TLcj7VP/vX0ZfFAn1SvzoupA7Qq5
	fnG55ahgAP8XH/i9SCvP5/eOeAezujVXgBM9USW0g1l9EDeulkROYKGYz74nQlZUPX1qVUFePalV+
	ZwKQHn8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAII-00000007tPD-1x5b;
	Thu, 01 Oct 2026 06:29:26 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCAIF-00000007tOa-40rU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 06:29:25 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48b042e00f7so706663f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 23:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790836162; x=1791440962; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YmUdotlXBym7+M7DTZqezt6CY+s7rUVFUXVNY2HpXtE=;
        b=Wj6PCSmafjnukRPqeDvARwyAyeNNU76pyiLE3CrH7a1B7znxu0HfG9UnEezQBgvs5M
         8+hqx2NgYon0/JcuqmZjhkIpRgd2lANxZO6qnONj/Tj5oR6FIUVb0UR9J5j9WuK7VRav
         jeCyJHOIQtJP+I/gEIVZxFmgsVo3a1bNmOe6tNumYJrVVGGjT0QUWhL9IeFCZ7h31RLu
         46bpIWCXb//k9gcV4ZBsbjZxXW7s8IG2etQEA5ItBZHRiKvyzDHRI0rfPbburhJL2JgD
         QCyksivDiYFYujd0vX2Cr5YPvxCToOCWHHwkNW6fCkxnmk8zD7bi7T6MzCSU8vNYLSra
         GTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790836162; x=1791440962;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YmUdotlXBym7+M7DTZqezt6CY+s7rUVFUXVNY2HpXtE=;
        b=MuFi4RR+4MieanVch6BNKP38JAGQCtt+Tu0JYf7jRKiHsct31rT0xsR5X7EyOAegPv
         c2a5i0Qm9zGCl6n5nVg45+SekETF1s/sDPobCfiAaobNOKcfRHvehTT7DQHpelPK+Qe9
         zzcbUAWP5NmlILzggwUiGuGcU7uHpPZYyUjw5T3rNWR4XY7RQGaMz0dHWzago04EF7x5
         78lNdDphrvVYnp07EiOxuEvtNHKEHjraRXvuB4ffE5JRUh5wa3OeeXGm2OJHqI6cH13n
         OkdgRmURtjthJ+jSyQE4U9HikjreyJCYvQhwoeg0js7PSP7515WZDpOgubG411S8xDOx
         15Ug==
X-Forwarded-Encrypted: i=1; AKwUvBy9JtP0RoVz9KymuFDQcROD6surPxndH9ZtU1W/GIacELlXCnw0LJICAPDT/jSRnIcCF0M+/bvFDBEFQJCVQS7H@lists.infradead.org
X-Gm-Message-State: AFuF++lwzxZoTsOv9Iyaa2qfxsXfH3u7S3BfqcmGGK0XMR9ITSN+iXxo
	ENMEIhIJVNzb2+H+20FEtVtBU0mU3I4S3wbGQibLJzeoQHFfnH22T7YJ
X-Gm-Gg: AYBFou2Ydxh0SdMPh8ERUSC565rXgjxmaz6EPO/wVHsj4NiRr8TiyT8NwJinXzpBXHZ
	T47k3rxY7WVVJ4TE8GUYzxc5ElLcmtcOxdvlvUQzKjp/l9EAWoqbq5Ut5fbz/NuythSrI1pPMr6
	tAxiky0QPISRnuPDN2QELkC1dfCMoQ12MO4qPUDQWMp1weB3cOoHS4qLzsEamKbDT5EZx+oRsBF
	XJ6rWJ5KOb5Tn2nvkY+vfUwQUP0aoq9sZLP/PmPcp+BaQqgOjX+rsYPdMkMPz2a8bNJq5BRPgSC
	6m4HwYnhSm0UxPy0bnQqwqaM8Jdi9uI4ddpWD7Y9Fpuc+polVvkpyCVC6lf3a4ReBpK0cgLG//z
	j35VtQ1Lq36R6gviFfhghVWeWBleYL+wo+pLF9natlNR75aulwC7hQGDQTzky3HCJkz+VvoFltD
	zjTFj/c79NYe1BmPwW6fYQhK48chEZDYhjcMnqRFFp4EE9b0uspYBtS0QA3PEkextdsZfhCwI6+
	M/KTgIslxp4ue66Sqbr4tCMwz3MYWpD
X-Received: by 2002:a05:600c:6088:b0:49f:fd66:5fec with SMTP id 5b1f17b1804b1-4a01ab4d57dmr54370375e9.0.1790836162047;
        Wed, 30 Sep 2026 23:29:22 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff891sm4026217f8f.9.2026.09.30.23.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:29:21 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jason Li <jason.li@cortina-access.com>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
In-Reply-To: <3ddf4b8e-14b7-442b-9d4f-5167875e3d64@app.fastmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
 <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
 <179076749140.3134070.3869742286743401078@gmail.com> <SEZPR01MB42087271C56AD1C7E926AF35A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
 <179082517588.138645.14615134489246049313@gmail.com> <SEZPR01MB4208B8B4A5A7F48F7FFE0C9FA28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
 <179083239972.193541.4791387611943615705@gmail.com>
 <3ddf4b8e-14b7-442b-9d4f-5167875e3d64@app.fastmail.com>
Date: Thu, 01 Oct 2026 09:29:19 +0300
Message-ID: <179083615914.311026.2458351803214458859@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_232924_045733_C635A981 
X-CRM114-Status: GOOD (  10.96  )
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

On Thu, Oct 01, 2026 at 08:18:56AM +0200, Arnd Bergmann wrote:
> No objections from me either way, but I don't quite understand what
> that will mean for the older parts that that are still sold by
> Cortina Access: cs8032, cs8022 and cs8124. If someone later adds
> DT support for those, would we use 'cortina,cs8032' or
> 'cortina-access,cs8032'?

I would go by the part number, the way fsl/nxp is handled: the parts
that came out of Cortina Systems with a CSxxxx number keep "cortina",
so "cortina,cs8032", and the CAxxxx parts that Cortina Access designed
use "cortina-access". That gives a rule a later submitter can apply
without knowing who sells the chip today.

Jason, if Cortina Access would rather see its current CS80xx/CS81xx
parts under "cortina-access", now would be the time to say so; I have
no stake in those and only need a rule for the CS75xx.

Thanks,
Fil


