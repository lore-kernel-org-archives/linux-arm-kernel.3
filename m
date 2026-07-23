Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA48C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 20:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7lA+u/oxodyHJlCoKL4TQghcRLJnH86jNWrERwY04g=; b=B23B2a7qN2QbHVILV0DYup4QjQ
	RnMS3E0yjFoLQBJuA7H2pVFpLf8B5ZQSPoUIZEP1ljXe///jGWml1kU5hF+7tGSUQkIwolStD3uAA
	1xN6a2N45shaAmQD+TTOD7999IpJ0yaMiel0veOSMQF3rvyJ81yMstKDAstvVQ+teUpyR4h41Kz3X
	kcGUale/3/zQK/kA/nwlsfGe162Q3/+/rIlQ/sQb0cJgOA0Ibnk05QFyLilTIXhPc76v/HyoQDATo
	3rSmRx5M3f+KSWycP9TicPqPqK4Cfkynh1jtNYUtwyyC8TPNBam6kRtIhPdj0irtAYB9z4hWQjyVd
	R8XesB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn0Vu-0000000F5U1-2kaC;
	Thu, 23 Jul 2026 20:59:30 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn0Vs-0000000F5TZ-1HKw;
	Thu, 23 Jul 2026 20:59:29 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784840350; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XHif2z3TyuE5eycS/9ovhpdeftUuvS6AkHk7IgpY5oUA6rhmHLRayF9fqgqAZMKYrbGdnPsx0/iHPl5xdKuufA/rHDuaZ6czUKLtaqFlsCaTlhkg/h+hLmJUMzurjW1gzSiBHuqWTCP5xSL99PAt5CBvJXLd4kGj6vJSAzrwcd8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784840350; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=K7lA+u/oxodyHJlCoKL4TQghcRLJnH86jNWrERwY04g=; 
	b=Ooy0733DzYK2a2KdfEEyI5HxXZb1kZsHY8VSm2lDfEfvq7FZfMN5H7+Gl/62T7aS+DXcNkaHeJ70woPD6qPP4IPw6BRpMoBmCs1OgtmEclVsPi+3rowaZ4z2CwB3xdWL6RvAoJbgmEc5voTlAfnah31KwsLSKWYNZuUisUWkRJg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784840350;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=K7lA+u/oxodyHJlCoKL4TQghcRLJnH86jNWrERwY04g=;
	b=cTPuqUgOR8p7EZ8gQ0VPzQxLr+Hn38SKMcF+PqyywbCJ4mo7pJesyhul+cucfNHE
	hH20o+4Uykfo6bDrTduOWQriq8xzaTS6r9AiIqApBAQukfT4oTg6rgTXPzeTMw3YDq7
	aNC+dkurpflZKNaE12UYE3pRzcmIIvBXVwsjfwyI=
Received: by mx.zohomail.com with SMTPS id 1784840347474174.7560622262041;
	Thu, 23 Jul 2026 13:59:07 -0700 (PDT)
Message-ID: <b0db52f6-cb3c-432e-ac08-d864971a8624@collabora.com>
Date: Thu, 23 Jul 2026 23:59:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: synopsys: hdmirx: add HDMI audio capture
 support
To: Igor Paunovic <royalnet026@gmail.com>, sashiko-reviews@lists.linux.dev,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260721064115.64809-1-royalnet026@gmail.com>
 <20260721064115.64809-3-royalnet026@gmail.com>
 <20260721070036.51C371F000E9@smtp.kernel.org>
 <CAEWPSH7FZw7XDhHD6x+mWcQR2VnLs5yF5LUGMisQoCsv43-z8w@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAEWPSH7FZw7XDhHD6x+mWcQR2VnLs5yF5LUGMisQoCsv43-z8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_135928_402698_4EBFB19C 
X-CRM114-Status: UNSURE (   8.74  )
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

On 7/21/26 10:51, Igor Paunovic wrote:
> This one looks structurally plausible, but as the report itself
> notes it predates this series: it concerns the video_device lifetime
> on the V4L2 side and is independent of the audio support added here
> (the audio teardown path was exercised on unbind with an active
> stream during v3 review, see the v3 thread). Addressing it would be
> a separate fix for the existing driver -- happy to leave that call
> to Dmitry.

No need to worry about it for this series. It is a niche bug if it's valid.

-- 
Best regards,
Dmitry

