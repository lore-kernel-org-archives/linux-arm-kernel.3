Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D20C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 18:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSqLovKCg0Wp1phThnzXec23DT+S5xG7EY7Nsy00BIs=; b=cJQg5P/DQ49Km8R/lWl0IYYZKQ
	vAvC6bFUhlbqdC6EVdHG5ovAHw8x1WWdMpHHsYpaZvh8ntGQIepqQCfHQyKUL4mzbFrfYLa5lLoKL
	+8xQG4lz+aY8c1l9c4O5jErs4ID0fmzmlwctNzMRBKLZV580QU9AdLTnzM73j/6IOLxAlGdqKqcum
	Gao1Tage4OYw7fO0+2L885ghbpLMnAf2SP8GFmdIMIlPGXA7LYTTR/ILIS947oMO8y8Q49wrAH67m
	+KqcSswFH3n2orzxnQHjLqsmWWVdUS89lw1wqtNnTghE1u+QDUpj0Y5LI0n3IpEwnRZS0ZsHardjF
	2stgHwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYr8z-000000015K8-3KOU;
	Fri, 17 Jan 2025 18:32:33 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYr7j-0000000158A-2AyY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 18:31:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 92D541C0003;
	Fri, 17 Jan 2025 18:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737138672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CSqLovKCg0Wp1phThnzXec23DT+S5xG7EY7Nsy00BIs=;
	b=Hn9vJXLKu6LkTpChEDUUJjznRi+VKRwggVK+xEG6/3a6jAaPNwHMBByHy0vukBguPDTpuS
	tiPp/WJx0B+u0JM/N7+IhMS0BuZJ8nW/n/lpJt66rwMOpPOTPmmHfo5LU3RTFUXuCL4icw
	FXSMt+OodONG38+gnkMU6yuWJ3ejY5Mo0QA/J7fOjJ4nhd+DoAUAM73Or0vQ7UmoPcFRyD
	vzgnmysVphXHSIUIBy8xgbCqkh4NsnIQjItSeJZGXbgOK2Cty64dc8iz2eIOlsicBcijNr
	DsXb1DiA+zMj+kGYU243/dMgVWrf1Fae8pmVGTBkigK97ai3QyGCGkxx69aCKA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sean Anderson <sean.anderson@linux.dev>,  Michal Simek
 <michal.simek@amd.com>,  linux-spi@vger.kernel.org,
  linux-kernel@vger.kernel.org,  Jinjie Ruan <ruanjinjie@huawei.com>,
  linux-arm-kernel@lists.infradead.org,  Amit Kumar Mahapatra
 <amit.kumar-mahapatra@amd.com>,  Conor Dooley <conor+dt@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Rob Herring <robh@kernel.org>,
  devicetree@vger.kernel.org
Subject: Re: [PATCH 0/5] spi: zynqmp-gqspi: Improve error recovery by resetting
In-Reply-To: <5942e111-24ba-4d1b-bd4f-6b81dcc6c5dc@sirena.org.uk> (Mark
	Brown's message of "Fri, 17 Jan 2025 13:21:58 +0000")
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
	<5942e111-24ba-4d1b-bd4f-6b81dcc6c5dc@sirena.org.uk>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 17 Jan 2025 19:31:08 +0100
Message-ID: <87h65xi977.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_103115_687088_0320F4D9 
X-CRM114-Status: UNSURE (   9.35  )
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

On 17/01/2025 at 13:21:58 GMT, Mark Brown <broonie@kernel.org> wrote:

> On Thu, Jan 16, 2025 at 05:55:16PM -0500, Sean Anderson wrote:
>> This series adds support for resetting the QSPI controller if we have a
>> timeout. I find this greatly improves the stability of the device, which
>> would tend to break after any timeout.
>
> If you're hitting a timeout that tends to indicate there's already a
> serious stability problem...

Yes, unless the timeout is reached for "good reasons", ie. you request
substantial amounts of data (typically from a memory device) and the
timeout is too short compared to the theoretical time spent in the
transfer. A loaded machine can also increase the number of false
positives I guess.

Cheers,
Miqu=C3=A8l

