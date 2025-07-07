Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0B5C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+GvU18DOqqiY8zTdFJCz5JrckKebklarr/J/4N8L8yk=; b=iFvTCns/9KnA0H1iYaO1BU4FQn
	rG8v54qJKmNEEdqPIMWn9MMLe7D3yX+sF/q+hBNcwpelvXeeSjY+qMF10zDK+aapjUGZeekaQiGC+
	8XAJK5kaxzf7AASZedQ1Sl9a/2AmZv82Ush/L1xGNhl/CpyncuAWGSTmQLIEdO8UWUwqP0AGuubFz
	C4pw3WkEELUrOyqaBROF8c9GWzebzEFCrBLKLnVQYVkQTa0hgqCZimInkX55drrybcFvK6H+TjCwx
	whAXC1ZEUDZxgpFVy0Qw3Qk3KlxpVdbp9aH+bakoBpEif6P4cJbgB4ojrVKh7EltCIsNcbQK12rUl
	sW0EPbWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiXi-000000023ei-3uaD;
	Mon, 07 Jul 2025 09:53:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiDe-00000001zaE-2eW4;
	Mon, 07 Jul 2025 09:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751880781;
	bh=juc1uD8h40wIfZMQNmHnpyqExi3zRLlYO4TDODPHXFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JQ6wodTvDmy/b9DtS/pdAefE2yXpzXmVwxrlGUiRge8OY87qEoQ7eZHuUWmh/EFdU
	 9bjUgE7nkQ7UXMpu7LZ9RIcacg1Qt4o8yjdVmEdfO75d+vCjW6hpv+hA35xSGu2ey9
	 BXboBhWVaNN6xX9AxEqWRFw+h5uYAmOqK58g+NbqlLcunfHe3mgZVqBBtDZ4Uubtfm
	 WDoqmuSXXDBrbFQ6+2/AcR6CVJO1NSoZ/Wo6fuwpeqeAsOBbmJYJrpsZWMowepboZs
	 k2d/+TTNwBz1PYP+J01njEpwsZ8LDqvXVbzzFp4aTgpANs2Hoi+KI5GA9rth3w/SLd
	 5WHNCRsqhoQHw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9BE3E17E0630;
	Mon,  7 Jul 2025 11:33:00 +0200 (CEST)
Message-ID: <ad575b88-80c7-4301-96eb-b34d97c5d5fa@collabora.com>
Date: Mon, 7 Jul 2025 11:33:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pwm: mediatek: Ensure to disable clocks in error path
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250704172728.626815-2-u.kleine-koenig@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250704172728.626815-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_023302_813399_07447168 
X-CRM114-Status: UNSURE (   7.26  )
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

Il 04/07/25 19:27, Uwe Kleine-König ha scritto:
> After enabling the clocks each error path must disable the clocks again.
> One of them failed to do so. Unify the error paths to use goto to make it
> harder for future changes to add a similar bug.
> 

I don't like gotos, but admittedly that's the cleanest option, so:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

