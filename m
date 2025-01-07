Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201D2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 07:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fyjpROUPKqz0yOrw3lpCO0/rz2teNQQiUnOciqqXxZA=; b=YXsShIMQIqIzxCo7n1QY2HUK6u
	8+92ofJucQ7wLZrV2Ovj7QOnOlLS4FBKcDPbCoM9Faw/uJGEoDSzuG9e46bWkKLqVbobc4J/iH2OK
	3L2KLD8dEqIcBH//b2XpdtpyRmfBjxeXKuCqJYz6Llh0VkI0vT2WlEjKnybYWB0lenvY4razhMk+x
	yQTLfjxwm/H28Gt479YnTF6f7MIixigJv6XGQreZw6DTow77z42WVlVdc1kK+2kAw9oyWMRMssMFF
	QUD6ciHBspdOc5rDey9cCchpvCOgohJdKnjXOXPhvhNPJRVGWX+VTIlt8n161kat73T7EAZvhcU7/
	C3PpOLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV41k-00000003l82-2oSD;
	Tue, 07 Jan 2025 07:29:24 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV40F-00000003kuZ-3Asu;
	Tue, 07 Jan 2025 07:27:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1736234855; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QXWTIpWVqxpOeg1IeOEIr6JsM+7G3I65kYd3BuGPw2DaD4EBqDAtPCzUiPfbVAb5ZnLza8qKVd+gZshlXHdLYwhz4624P1TCtV0CiQpC4zsTLQQnbxKL7+mEcQVs6bm2xs9m4Fr2nWEjimsTGpEkW7s6PZI77e1CgBXTy5dtLl0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1736234855; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fyjpROUPKqz0yOrw3lpCO0/rz2teNQQiUnOciqqXxZA=; 
	b=a644ozs87rf4CXJ3UrMuY7xEojRKhvbFWTnYevaNZcKizu4ZfTgHqzi7MxSBmyP657wJtPgR03IGkX8VHn1OjXaF9Wc9xBk5fC4w23kCGSpeUnG1fPMAY7eDBxaUPVuhYzO59d+bjwUNJJwG/EfF7NVPYyuM7Z0e4xbDJBDjjfw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1736234855;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fyjpROUPKqz0yOrw3lpCO0/rz2teNQQiUnOciqqXxZA=;
	b=I11xgHOoNC2rhJ7Jol1KFQIBNVrUn1IQUZyRgQ466AtyWmW+9w3Tyo69badWKgvt
	WXAiBUUyomoo7Mj9jzemsOZyqHtZZnLWVg5DlYg+T31CZubU/TvCcyGMZcm2TohcslA
	87cJKZguiA+tVchZMuuZHi9Ye15hzkkWu7o6KOig=
Received: by mx.zohomail.com with SMTPS id 1736234853465966.2061584357726;
	Mon, 6 Jan 2025 23:27:33 -0800 (PST)
Message-ID: <a5226fac-2a5b-47f3-b32e-8662bf932bd4@collabora.com>
Date: Tue, 7 Jan 2025 10:27:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5 0/4] Add Synopsys DesignWare HDMI RX Controller
To: Tim Surber <me@timsurber.de>, Shreeya Patel
 <shreeya.patel@collabora.com>, heiko@sntech.de, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 hverkuil@xs4all.nl, hverkuil-cisco@xs4all.nl
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20241210193904.883225-1-shreeya.patel@collabora.com>
 <acb91a34-c0f8-4f03-8945-755b4e42dcf3@timsurber.de>
 <925d7571-48e4-437d-b55c-3f7bbad8af1d@collabora.com>
 <fbb5016e-678c-4e54-a6a8-0ccaa2bdf45c@timsurber.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <fbb5016e-678c-4e54-a6a8-0ccaa2bdf45c@timsurber.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_232751_829710_D1AD8633 
X-CRM114-Status: UNSURE (   5.38  )
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

On 1/7/25 03:08, Tim Surber wrote:
> Hi Dmitry,
> 
> that was my fault, my build script did not copy over the new ATF properly.
> 
> Now it works, I will update with test results with many different
> resolutions/formats here soon.

Thanks for the quick update, please post the results once ready.

-- 
Best regards,
Dmitry

