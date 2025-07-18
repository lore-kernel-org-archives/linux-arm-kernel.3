Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E37DC83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 18:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2xIIPdhqVfGQJUuusBF8KYkPWzXBgEwTeh2fEMZTkaA=; b=KN6b7CswkhWtu9rTPCeQm7AKFt
	gCgXXhPBcz8UehXpHq8o8zud+AUwUjSIWC4YnUpk1zyaRucH0UGUb4vxkOn7KeSu3fVPmaq9XBsx3
	jWpz0V41lpcohphFBOg/dozpAjqvblXjDGxsEp4ACBU2A9lSB8WH1VUV0zP1ow7Cq0ZBCszKB1fEe
	joLjUJkh3qV4gU/4xSnTiNXfd3wkNwWYHJVTCSGc2/SIfXsCrt0/mDdtHclJGRrxnobNedRxWTz+Q
	jMmLBknDro6DIV33Re00VDSL+HWz/5lEAMq32/8tSp4cl5qRO4fKDo19GgRSMSOUIRzbAGlSnYrgA
	hc4L/I5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucpty-0000000DJCy-3E56;
	Fri, 18 Jul 2025 18:33:46 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucprW-0000000DJ5y-2jjF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 18:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1752863446; x=1753468246; i=markus.elfring@web.de;
	bh=2xIIPdhqVfGQJUuusBF8KYkPWzXBgEwTeh2fEMZTkaA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=edS32uM/OGSYIGHaj4nlBq8UzHWjarnUtdSqjodh0UznFNY9Oxt1/d/5mf0OYVhX
	 7qwv6Ivkedmh3RlIBA5c25gdbyTEqLa7VfgTNsvNrWziJ/f7rGG5duOv5ndlDqkBH
	 ivBaxCjKW9EWnNj+BoFhkpBRjCSaLifLzs3q/FSOglHUWfQnXjv/HjiFL8P7tRqs0
	 C91rVtzhS+OPNvtLJ/QluT998pcPsGYIcuqPMGQvTJT2bb16pzNCeICvrCHModcsK
	 vo/PbTMcLiudcFtluHrJkqb5g8vzy/HcvaW5PtCzqn+w1T3DDkVapzbECYbZFqPQs
	 cIPgIUgUeu4HPmrDwg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.219]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M1JAm-1ua5lc28jK-00Bk4P; Fri, 18
 Jul 2025 20:30:46 +0200
Message-ID: <effb9b2a-73da-4e0f-8672-b9d3f800b8b4@web.de>
Date: Fri, 18 Jul 2025 20:30:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3] net: ti: icssg-prueth: Fix buffer allocation for ICSSG
To: Simon Horman <horms@kernel.org>, Himanshu Mittal <h-mittal1@ti.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, MD Danish Anwar <danishanwar@ti.com>,
 Meghana Malladi <m-malladi@ti.com>, Paolo Abeni <pabeni@redhat.com>,
 prajith@ti.com, Pratheesh Gangadhar <pratheesh@ti.com>,
 Sriramakrishnan <srk@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20250717094220.546388-1-h-mittal1@ti.com>
 <4c677fdb-e6d6-4961-b911-78aaa28130e6@web.de>
 <20250718143225.GE2459@horms.kernel.org>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250718143225.GE2459@horms.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:REMjXiQwS+2Nygyl+iKV1Dom5ZZBmsPRvkvuE1wCjjg0Ue0IUNW
 8rFCUHAB0PkTMAXVrmE0cLB+pgTGKH6vxNvh2mkC26wvOEHmY/a+nFm45PwwAk6yt11C0dC
 +XtFwS5S5tUn8YBa/wn0/4lmeooDqPC2RrBfPhVtKm/r8DQelgTvmL9JzVbeD8Kpfg+jiev
 soqBMqnic0G0l0+dlotEQ==
UI-OutboundReport: notjunk:1;M01:P0:edaEL2WEa58=;AScAbgCwBAH8Ed9s3wfg8Z9GHFp
 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
 Ht/0AE2iN/uZKM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_113115_065679_03FD3966 
X-CRM114-Status: UNSURE (   5.83  )
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

>> Can the usage of the conditional operator be extended another bit
>> (also for the function =E2=80=9Cprueth_emac_buffer_setup=E2=80=9D for e=
xample)?
>=20
> 1. (Subjective) The current code seems fine to me

Under which circumstances would you get into the mood to avoid
duplicate source code further?


> 2. (Objective) Your suggestion features unnecessary parentheses, and
>    incorrect indentation and whitespace

Which code formatting would you find more reasonable then instead?

Regards,
Markus

