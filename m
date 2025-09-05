Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF12CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 00:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JZsROv5dMPlTRseUFed2DQIQDmI+zmlM+eHGw/139pU=; b=3owqqimDaNDUK4I0BBt4Xkwg88
	Aut2xUxT9FAif1B9OfM1DVeYQNya3k5t37T0O1VTvEz5+RT7xHX4YIwBv7g+YECGb2RQYE4zGjY8v
	LR67A7148JF+69Cyi5uv61Wt63xEyEwFpORKFDYECyX6Rc6I6LAvbLC8HLfTBamFIifsOxpgSr18r
	3BY+lbIs3DBGnIQ67L30cT3IldNBWApGkULA9uGkfP/OGU5jGILZe4vtSPJONYJ7TRqBjkAc0UuEg
	L37QLGDukxbhU2dvNlHidv6oXhoReXBVc3xP9SiaHOIOtqd1aOu3nqsQSF0OlNlVBAas6uEa5YC9O
	vpJac+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugXE-00000005UtQ-1j0B;
	Sat, 06 Sep 2025 00:12:05 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uubVF-00000003upc-2IdG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 18:49:43 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cJQ5G0lxkz9sq0;
	Fri,  5 Sep 2025 20:35:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757097330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JZsROv5dMPlTRseUFed2DQIQDmI+zmlM+eHGw/139pU=;
	b=wSA1qxOQ+B5OJr41dcgkZmuhOTiychl0t9gOaUn7ogSa8gIUiH9dW6JZ8B162DXzy3ILvd
	0Xhp9WuEtlgSXYRAOytyyVYl8T2RqB4oqTqlw/vyGgIQcn/bJC1uVas7YP26Q+3tUlTdH9
	H7TBlwpONHAUlTMGOghGNumalKlSQC3DnKZMnjTFAEewldEA1LN31OAIM3cycG1fIlcTnX
	Glx8mK6rnJ7jn5VE3qGM6DiDHn23EiQxnF8WtfUA5Sl+lqKQFsz/YzwSxSbaesug68cDQh
	91Hwj1GSW3NFaC9RLkYv27W1QQVmvrpC/JI53g3bREd9lyupZ4X4Zvi/+j9vtA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=x0QyrUWO;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <273d5067-4c9d-4c8c-8633-7f2d7c708216@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757097328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JZsROv5dMPlTRseUFed2DQIQDmI+zmlM+eHGw/139pU=;
	b=x0QyrUWOzMPakvYxi/Zbh5R5bygqUzCDTJYvPKP8/FqgDkYQCCzFp4EXHsOu9quW+x4/5z
	wdivkVL2ZkVk1m1mpFlfjkJOfwRqR/Qu3bfmnH6QEEol6An0CT1tskwG5X/h6VLQforpc1
	NU92T1MSc2SeEo89qi1UpFDiSERlqoedGE/RJCl1ykcw7WXnWpVgpR0uWUp/fThPlbz+jQ
	3wuTN7U3UwyA/Rlv6zmRcHpxpcDxuI/wqYwvjh8VxJhQwAJv0JpSRzSiD2VPbRbAzH6p+z
	Ly/lSrveoFofuNyYYfIm3qikjSsVGg0I2DOsRK5QXEV68eZM4Or9qrQcK5AUxA==
Date: Fri, 5 Sep 2025 20:35:25 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT DTO
 to Retronix R-Car V4H Sparrow Hawk
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250905020149.257459-1-marek.vasut+renesas@mailbox.org>
 <aLrXzl38OUhTJgxP@shikoro>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aLrXzl38OUhTJgxP@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 16010d7b6e6bae5f7f9
X-MBO-RS-META: s9b7313iouson6bdjrfi5inu7cjzpbyt
X-Rspamd-Queue-Id: 4cJQ5G0lxkz9sq0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_114941_750938_850CF7FF 
X-CRM114-Status: GOOD (  11.27  )
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

On 9/5/25 2:30 PM, Wolfram Sang wrote:
> Hi Marek,

Hello Wolfram,

>> + * r8a779g3-sparrow-hawk$ grep -H . /sys/class/hwmon/hwmon?/name
>> + * /sys/class/hwmon/hwmon0/name:sensor1_thermal
>> + * /sys/class/hwmon/hwmon1/name:sensor2_thermal
>> + * /sys/class/hwmon/hwmon2/name:sensor3_thermal
>> + * /sys/class/hwmon/hwmon3/name:sensor4_thermal
>> + * /sys/class/hwmon/hwmon4/name:pwmfan
>> + *                       ^      ^^^^^^
> 
> For me, the output looks different, though:
> 
> /sys/class/hwmon/hwmon0/name:pwmfan
> /sys/class/hwmon/hwmon1/name:sensor1_thermal
> /sys/class/hwmon/hwmon2/name:sensor2_thermal
> /sys/class/hwmon/hwmon3/name:sensor3_thermal
> /sys/class/hwmon/hwmon4/name:sensor4_thermal
> /sys/class/hwmon/hwmon5/name:pwmfan
> 
> hwmon0 is the Argon, hwmon5 the (unpopulated) on board connector.
> 
> I hope the naming is stable, but in any case, the docs need to be
> reworked a little, I guess?

The hwmon devices are allocated first come first served, so the list can 
look different for you. You need to look up the fan you want to control, 
of course. Look up by name is simplest, if there are more fans, it might 
be a bit more involved to find the right one.

-- 
Best regards,
Marek Vasut

