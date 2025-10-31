Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56051CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 15:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAYicgWbeTqs9mxQhGa10rlScGyd0CZAWlkZ/jG6y2g=; b=d/eRUjvZYCzTWFh99eh5XlGewf
	T+uoVZJh0tEJIYRvkzdFwyCz6Q9HpXjC1eCvt0dQyQSSArRzfE+KAsIHIn6FBdpJRgOvUZJpXZZ+r
	knW6CGNzQulvkpWMqPOk57cbVqqlkiTK1xVq9PPeVdgZkHQDg5f49lF/E9ddQ8R7Wfgxc0eqHlyt5
	/bost0fQoFMkGoIIZN88hkxT+lDY8Ssv90wKYTvBfhx5jXregI6rQmKnKpi0a87eQeCG/SXRpKsfo
	YnqSNPfMroMVAa8aY1qqYJLkgY9pTk2ChoBkGSPHibyBqhzYqGWPhmNa/6IrPEibURiUQuXW4hzh+
	exEhC7Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqiw-00000006ITB-1kVe;
	Fri, 31 Oct 2025 15:07:30 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEqit-00000006ISI-0DJm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 15:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1761923223; x=1762528023; i=markus.elfring@web.de;
	bh=CAYicgWbeTqs9mxQhGa10rlScGyd0CZAWlkZ/jG6y2g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Gw72x7eYULvdndwBCdPyVOUi3DoaZwouFm4aIl7JPRrr6hRcm6Zoi9mAzExquanS
	 nnTQ6dSdCoIjXls9TU9TRRxb0cN1FlwlrzYPAMq4iWSbg2Y3Yhwvu9sAxQAw/5ksD
	 pu9zQwHvuNtgMR2rt+NeoHcactcVhhcwkdqykIIUdGFpnv+V6wd+h76ub2B71s/fh
	 w/AE1VIy8zNzau988iBkiURurJtC8lE/0w9ScpftVRcvuKXtZAvOTbDJASKAd+JLl
	 1fIlKHf4aiKz/L7dawiROSsVBUFA2RcqOxVj03VH3BejLCQbM1a2aN3ByS4rx14v2
	 rONGd0kwCdwMPnw0YQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.206]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MbkSC-1vpZe43L5S-00km8h; Fri, 31
 Oct 2025 16:07:02 +0100
Message-ID: <06be737a-365d-4a2e-89dd-72fe415bc7d5@web.de>
Date: Fri, 31 Oct 2025 16:06:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: clk: keystone: sci-clk: use devm_kmemdup_array() once more in
 ti_sci_scan_clocks_from_fw()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>,
 Raag Jadav <raag.jadav@intel.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Tero Kristo <kristo@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Jonathan Corbet <corbet@lwn.net>
References: <a8e94921-a426-4db8-aed6-b6e17e88b8e3@web.de>
 <aQTLHlv2_V9Pgjk3@smile.fi.intel.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <aQTLHlv2_V9Pgjk3@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CeAyZu8pRQKCAJj0rELzvujy0zKPWs4AEHFKlNsaBrD/pZYoBQa
 rvmwqxG9sqBEhSlB9eBu9cj+ufCCjG8nlJddf7y3uK37B4e1EYrsZhKsltcVfOkFz/BikXP
 wQI7erbjQqvQ4m0HzowlVi06Gjqt9/o9zN4osvozxY1keGYWzc2zkVydtriUYrdsJLrvzXJ
 B4zJNkkAlxtOOPPkAdoMg==
UI-OutboundReport: notjunk:1;M01:P0:eyAYh83QM8c=;w9/KmFsiwH0Q6BQGJc7x6Ff1296 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 wz2pbl7zYB/ODuYTc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_080727_446635_C0A8CBF5 
X-CRM114-Status: UNSURE (   3.89  )
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

>> Fixes: 3c13933c60338ce6fb2369bd0e93f91e52ddc17d ("clk: keystone: sci-cl=
k: add support for dynamically probing clocks")
>=20
> Wrong format of Fixes tag, please keep the SHA at bare minumum.

I got an other impression.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.18-rc3#n145

Would you find information from the commit 6356f18f09dc0781650c4f128ea4874=
5fa48c415
("Align git commit ID abbreviation guidelines and checks") interesting als=
o
for this technical detail?

Regards,
Markus

