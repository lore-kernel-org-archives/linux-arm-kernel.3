Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15B0CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZT9omW2jTR94H3AAyBDs1RZHTPU5hwklSxdZ3hCk9QQ=; b=RQlv9AgR+vjxn5LWLpD3Td1HbZ
	WH73dHPwfuUPkNSAKPPCC65uAFhdkhI0j+beUIX+iv4mzZ2Odv7qt6+/tYkZm7MetsD8aycB0Vcvd
	ADF+/8vghuaaggEiMSAc2nrv0aSEE0IPUT2WJ3L75TodglQsq3b9snAzQOvH6vEXG1ylK+mVX2Mq+
	cEjImsgUhhIElihqzjMvd7E+9FJMa3yPwj/fw40rYokox16wQwEG98fqXY+r8gc7yAWzpnGHQkcjt
	UUQoRW4u91gs57Kt0c/W3+BbSJvWu+2qr62+oodM8F9qY9tiGcZTPYA1UobwYaiKrjJJKMtEGMWYn
	YsViLj2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2Ev-00000007gwa-00Qe;
	Thu, 21 May 2026 12:11:01 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2Ep-00000007gvX-0USt;
	Thu, 21 May 2026 12:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1779365449; x=1779970249; i=markus.elfring@web.de;
	bh=ZT9omW2jTR94H3AAyBDs1RZHTPU5hwklSxdZ3hCk9QQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AmNjXnZ6KUdg+EgjrNMXKH5UHudWT59jX6yuTnEI+1yTJZ1vdKn5vRKQ8067Vvk/
	 EOb2R59a5sbQNh+x/QDsMYfK7R7rU3prAXNQwGvmZ4/Q/1ObSmaBuiWEHb9xEjHuK
	 NtL9zsGle0VvT7b37rbEGBvJR82ltMcb2D/g3eTa/zZO5GFUCIlTKlv6Vgo89p7+e
	 nAXTOzfTAhQEzta8/mZKjxV1433qXzT+LMNUx3DJ5lzqP9VOWQvXqIyXH3HFA5Gwt
	 E2tkNGbLquyEmWVGcMyUT34C6aiILhFP6gud0dRsyECjmjXPhqmNTHlYFXI8CWnE7
	 GzY4NLRkL61w0tmv3Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MF2gW-1wazXV0Naa-007czU; Thu, 21
 May 2026 14:10:49 +0200
Message-ID: <c1aba09f-0a74-485c-b787-59b215a3bd88@web.de>
Date: Thu, 21 May 2026 14:10:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260521041901.542964-1-grandmaster@al2klimov.de>
Subject: Re: [PATCH] clocksource/drivers/owl: fix refcount leak
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260521041901.542964-1-grandmaster@al2klimov.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Fm/59cDRfNx5E9NkMCcMFFTY6WZknePTxMAsffKndeh36S0Gqn3
 2rgM2ZpaR4/WPq9kbCVsxO0yI27ZUaXYzbZiK/zkUpmmeZO07QY6wSjKGk/awzu1t0Sl/ji
 +c0CF5hPJJohgzR73MFDWc7Yj0477B6SSvLUXKaR+Yc2uDfI6SGp2HSFnoGdLSDbcTuDFtk
 qIf/EM//Xrtlbpm17HOCw==
UI-OutboundReport: notjunk:1;M01:P0:UVu7husoB6Q=;7BGGW5fieLqyym3Q30BtZLQ3jC0 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 qtV5Ngaegj+YoFSkj4AJlINv/XE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_051055_474563_ED9E4165 
X-CRM114-Status: UNSURE (   4.23  )
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

> Every value returned from of_clk_get() is supposed to be cleaned up
> via clk_put() once not needed anymore.

How do you think about to add a wording like =E2=80=9CThus add a missing f=
unction call.=E2=80=9D?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.1-rc4#n94

Would the application of another guard become helpful?

How will chances evolve to adjust variable scopes accordingly?
https://elixir.bootlin.com/linux/v7.1-rc4/source/drivers/clocksource/timer=
-owl.c#L116-L173

Regards,
Markus

