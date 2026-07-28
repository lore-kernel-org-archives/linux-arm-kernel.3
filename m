Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A10C53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AIcAbR0xjsaYfJnIWcSClSS5upVh0OYFPPy2rQ/0vE=; b=A8EqPF7Otl11erOAYoSRGEkzGR
	PjS5Sb+K+0SJdv3vdEHTOIR1C1y4vvmv8xtrQPzs9Q01hwRMzifgpqOaqtlA0y93Il6jRyfnZyUAj
	U59oob4GLZqn86xB1qESflQB0sUjhmvsBlACY/wW9RzmTch7Uc/QKsp23KcWvKzh/du1RnkpGJ5kd
	REwl2htbeyjgvdHJV7KoqSMW/V4fT/bvb/5BF2uQA7bU6fr9hsLE4e0OFQBXwe931SD83oqVKe39c
	ul2pIa0HPcFPd24rv6MW3UILUUZX3SJwOVsGtSAx98/IdYec3jQYKaqL48cA3rGDxvZAKhEtNLQjL
	Djvwps7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiHu-00000005PQj-1dot;
	Tue, 28 Jul 2026 13:56:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiHs-00000005PQM-3QNL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 13:56:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1FA5060A89;
	Tue, 28 Jul 2026 13:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87501F00A3A;
	Tue, 28 Jul 2026 13:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785246963;
	bh=8AIcAbR0xjsaYfJnIWcSClSS5upVh0OYFPPy2rQ/0vE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WympEKjis5WhwlRHSKY1ULD7cjbDdEigV7OJN3bFHVZKe2eKTL72HSCwTBowULdUt
	 ska7DC6i+JQ/yNgg4Fdk/H+VSHaKNZRZJ2JUqIB3wRkCf/PMOQ8tq0Io9L7IyM0S7l
	 YdIGx/iH7M1oO0jAlJ8ilVX4Row0VR5PR/OAygH4BeT45iIhaQWtm9y+npqrdRuX0e
	 me//+EW3RSq2oiYdATa9Y+8lVUrOUCuUc9kdyJX03Yfsl8lKlozie7lSkRGYxo8ENz
	 Kk2pYaJsyfI5cnBONqVhOPgF27pqIJ74PlzZzYlrgnKAmmZWPZy6R3GUbJkAx0f8xM
	 ubqZcXbOVHZqg==
Date: Tue, 28 Jul 2026 08:56:03 -0500
From: Rob Herring <robh@kernel.org>
To: Suraj Gupta <suraj.gupta2@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, harini.katakam@amd.com
Subject: Re: [PATCH net-next 3/7] dt-bindings: net: xlnx,axi-ethernet: Add
 10G/25G (XXV) ethernet
Message-ID: <20260728135603.GA1807237-robh@kernel.org>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260723123838.125145-4-suraj.gupta2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723123838.125145-4-suraj.gupta2@amd.com>
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

On Thu, Jul 23, 2026 at 06:08:34PM +0530, Suraj Gupta wrote:
> The XXV Ethernet IP integrates a 10G/25G Ethernet MAC with an in-core
> PCS/PMA driving a high-speed serial transceiver. Extend the existing
> xlnx,axi-ethernet binding to describe it.
> 
> Add the "xlnx,xxv-ethernet-1.0" compatible and make the resource
> requirements conditional based on the XXV compatible string:
> 
>   - "dmas", "dma-names", and "phy-mode" are required.
>   - Interrupt properties are not required as it does not have a dedicated
>     Ethernet core interrupt.
>   - "phy-handle" is not required as it has internal PCS and PMA.
>   - Add the 10gbase-r and 25gbase-r phy-mode values used by XXV.
> Annotate the existing compatibles, generalise the title to cover both
> variants, and add an example node for XXV.
> 
> Define properties at top level per binding style and use if/then to
> constrain requirements and phy-mode per compatible. Forbid 1G-only and
> unused ethernet-controller properties on XXV nodes.

This looks to me like it should be its own schema file. The only shared 
part is dmas/dma-names.

Rob

