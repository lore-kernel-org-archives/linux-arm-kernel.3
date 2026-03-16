Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB9CF506C1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 12:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YtqjrvEqsLsMJSdmv0VvFrGwyA5l9tENmr1MiPP1vjI=; b=0O/9zOFwzJGqqQIeOiJrbLTlKF
	0vQifCWQl36H0JmYvZ/ncfYxUEhdJmop8ZYaP539NVm/ZrnDDO1AbNw9So8uNZ6YmbWGZAvO3FwqQ
	wyzyR+SZaNJbSWO3yK9gzofkL2jp/mNzkKcKTDr4YLl3vlOmGLq1+b04Y+eCebVZ6c8cBTwtDu1Ko
	orlsNTNZ2GcJzDFm50bnJMl+sBZ8gXg2viHdJvmX9Sq3eooNLuxJWbNhSD/a559FfwtZ67ZENJUfY
	YvkoLOhr0Kqu6BDPR9oZBFMoS20i66gGmeIo43yYPqkPRf87ovhEthpsSnTkgEikkLSJOd0TudHp0
	/m4nAYCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27CK-00000003y6X-3Dn3;
	Mon, 16 Mar 2026 12:37:28 +0000
Received: from mout-p-201.mailbox.org ([2001:67c:2050:0:465::201])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27CI-00000003y5M-3PW2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 12:37:28 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fZF3C2WhQz9tCL;
	Mon, 16 Mar 2026 13:37:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773664631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YtqjrvEqsLsMJSdmv0VvFrGwyA5l9tENmr1MiPP1vjI=;
	b=BESAIN72YvlVuHQqQMBGl/5KGTBRDRp4qJbZFj9RSgRZZVq79QmMCnsUIDbc9GWOia6nLT
	d44grwtQftsSUArzynxhtFaQtbUjS905YEeyKG1g3bw4Lx87v50KROPst6mdeJXN+V/42f
	otIgjtCZqLQ7xQ+HXrH9XkzDMBoWZ8+uDMoWg8J1BaY3myfg0imKFWj7TgKeIiyAsgNnem
	AXOi8ZxMR+5JO06fyU08enwGTUW4A/cDE7wSqDT3KeEsd0a55/OPfb7jXnDyw2+JQYX99n
	nQZVfSrwjIaoCyIwtMUDCnUKGzRy8pDkzuqU/OiT1GWJezSlH7zK6q5GJaxwog==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CoHcL7KK;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <15b47af5-1249-4911-b9de-7ee177740314@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773664629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YtqjrvEqsLsMJSdmv0VvFrGwyA5l9tENmr1MiPP1vjI=;
	b=CoHcL7KKQK5+sb0oMFrbVgv21wID5IlBb7SfxxPS4viZFvNt2eJu0oVsFBPiKJSmMBOuvL
	Ozi/VCpdY8G8a++wvug1hvpKISvH4mcRsSdsCGJZxwdRQLZxIcnPc7Nqh4KM7rjZUPvdN0
	fB3G6+FpuBGsMzsA3nFfLOFRPKgLacM4geUytkfY5eQVQqtPg/az9hFgvThEeW/BF9lvGi
	OvKa6QAai0jacC2FmZZw8r/3oD5qvYRP8U6cu9eztzcD+xmT+d7ZNubDMdwNUzKwaqBI0F
	TQGaARni6qKSNSGEnzgZ5Ho+eQeXXXA5a6fXjH/Z6gnNP6H11/WJ7fjxsVNmNg==
Date: Mon, 16 Mar 2026 13:37:02 +0100
MIME-Version: 1.0
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Fix PHY C22 compatible strings
To: Biju Das <biju.das.jz@bp.renesas.com>, geert <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260313164008.40933-1-marek.vasut+renesas@mailbox.org>
 <TY3PR01MB11346A57519DD3EB5BB4456D38645A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdX5+smUnspgxnEy6ewL2-3htqeP-d0kX7muMVp9AAqO7A@mail.gmail.com>
 <TY3PR01MB11346A1E1E15BB94F5C692B408640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <TY3PR01MB11346A1E1E15BB94F5C692B408640A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 94h6rw7cuogcfuapih3giamtep78stkh
X-MBO-RS-ID: 8d40d4d2f994c65228f
X-Rspamd-Queue-Id: 4fZF3C2WhQz9tCL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_053727_065513_1748D312 
X-CRM114-Status: UNSURE (   9.55  )
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

On 3/16/26 10:11 AM, Biju Das wrote:

Hello everyone,

>> There is also Marek's older series ([1][2], as Marek doesn't do cover letters ;-).

You seem to be commenting on a 0/4 cover letter here ...

>> [1] "[PATCH 1/2] ARM: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on all
>> RZ boards"
>>      https://lore.kernel.org/20240630034649.173229-1-marex@denx.de/
>> [2] "[PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on
>> all RZ boards"
>>      https://lore.kernel.org/20240630034649.173229-2-marex@denx.de
> 
> I haven't seen these patches.

They are deprecated.

> It does not cover all the SoCs/boards. If Marek want to take over, He can send next version
> covering all Renesas boards + binding change.
Isn't this series effectively exactly that ?

