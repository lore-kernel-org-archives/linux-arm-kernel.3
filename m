Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA97D75E21
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 10:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61ry4edPNxCuNRBy1IwrZKEtdY25zzE8aRAKjDIlzek=; b=o7etVVmNvU4HFzd+SNt68q3VGY
	1Lixi8kAna7mVorpWT0CeR8Nhsjt/R+M6gaY2WFTPXF71RCeMN78D7wzix0kFO2h3Mlyth3W1tEQY
	umjiuEFNerX20v223XfkfQiYShcag6V0H6cv5muWTGnHDybxAk2pWATtpXIqFfGgYBb1UJIirR2QN
	uiGBOpUgmK2N2sg8wNKL8kiGgOM9BScEUDktxITZ7VqwSSjMiYnkUXrTBc54mLKCZBu/CIm3aJiA6
	QnAERNKCmRigjWgN+xEQHZoxMPICdWlI3BRmRpxMCIVrqi3+tZE6yHniPn7L+aCxpUTC9umYdy2Mk
	ExLHQGrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tERIV-00000002Hnv-1fUe;
	Fri, 22 Nov 2024 10:53:59 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tERHX-00000002Hgs-2BWm;
	Fri, 22 Nov 2024 10:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1732272765; x=1732877565; i=markus.elfring@web.de;
	bh=61ry4edPNxCuNRBy1IwrZKEtdY25zzE8aRAKjDIlzek=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bUZEEQseerSEZWaPJwWTIDOlfNrOCV3Br06vAdhWk8Ahince6V3c8HeN7M7zCr8d
	 oIMIY8qr5LHOjyAJzAq/9SmX+KamYKYDmXliRT2Nsxo/d1sgYG8yWcIib9Pvsak03
	 Sp4r9Hz+pNnwlp8Lh0SIL2V3Uf+Drfy9izBTnPowU0JZVWg7aCBCJVipSqzJviqbF
	 sEXC9flSFQ2gsUxy8V8ZIoPqQSUONV4Pat6rZVAH0ZQt+rSrBZC1l3r672AhrYfXo
	 IKZEz6jJpm659neg4DfvkenC7yPfF/kVsXBjHLygKRqS4sFW/z9zbPHvDQkwNQs9m
	 rIGvfCznSFBoQlP8Cw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.88.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MBB86-1tR43H2250-00DcBn; Fri, 22
 Nov 2024 11:52:45 +0100
Message-ID: <ac730eec-e447-495b-8637-9c11a268e371@web.de>
Date: Fri, 22 Nov 2024 11:52:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhu Jun <zhujun2@cmss.chinamobile.com>, linux-sound@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20241122055231.3463-1-zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8188: Add error handling in
 mtk_dai_etdm_enable_mclk
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241122055231.3463-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GmQzr0ZnmJWTazBDBy9rLexiwHSkJuYvSOIIwQYIV1b4dUiK32W
 0lZqoDO/cwLrprsNuikXcVG8dtpPZ6s4woy2SO5ZD+mEKkX/IreYmNW80TTBlV/7ZNRZKDD
 KijEbz77zkmaHzk+moXi/fWVvT4mEOH9G6OvvwT2KlIx8jR7lFSSDN+4KSikVpdtYsFkGIV
 LGsx96eadnHg8MlkQ8bhw==
UI-OutboundReport: notjunk:1;M01:P0:aPeuCtx77M4=;/kQ1N/2tkJDzcS7IbzBA/UrOpng
 zlnmRmyp1ExMEhtEoZ8JfKGRZB+BTgjqexBpEfRDZTVlACb/pY4+2QTsfymAKC+f9koPc0CT+
 5lelUS5DZc4GS6mntxa9sRYpPJELdd46FbcsRqly3erV8VR8TPLj6ha+UwpWaLJGWpNIigM4o
 YDOzk8ryFn9xg39MCr/XCc2DslRk0vMExmZaHRMe6wMp4ETnyHj1eOe+RRkcC2eDk04CvV8do
 LDZWhaqfHKJKUSaZ0J3JyZ7bGKIbKMiVzZod84WXTN1EWP9DKjyKtjOGAfiqW8AjLFHU9w8de
 3w+9Z5jHXnxS8ybNtvRmsK/pGUHz2J0d2xTbzVFBHoFjg08Cd2akMUuQD5uY66zEM/yjUrenN
 mmSDC19dQUw+sZ5WJxejvduMEXOAnFFqgkkDJzaA91rfn3JRqu18Zxy491NG9VZH2S65LjeoS
 B4Ej/pk5xvR59d5VxL7wKiEa4fLB0npL8aKs+LQWg0eLnEGHROHLjGxWuw2+8YoMALGOzFTmy
 Lzdpbka274mgYEinuaby9RmcWr32YpCueWokCNIOBQ0rGHFuNT/XMRYwrXPQHWisPMrya21aV
 o/znJOZrjSAZRFk2YfgGGqRa+tlUSRl3EcpAZs3xDduFMZzpfJbPqDSlPrGYOIcZdS5FcqrxP
 trQIXskPY4KD1GB8szZcok4XjhBcHKE8epikn+NWk5h8W65eu7g56mr3Ywp/4CflpwCPwI/lD
 2mrAW+rWvLb45d3/KeviOtbfzePk346/r5Lp9UBwskkc+qsTl44SGEwjAbZ0ta1PNU4utVlgM
 UPZfvTz9qYBEPbw6UxVylwxF7oULqPVAREOF9Jzo7cy+qrfi9qzad/TCsq9Jm0u4ivC2yoZBC
 UBYqzU+ukc9YZfx2M+/8uVO5mugeDInuGat36F3WWPHPO3Xr7OrDfK+HJCfm7yhIb5SFo8H6H
 LhFxz4QEEd/Z5xCi57g9JbogIeiDI+xyDeppl2g90k7LmUWIYOZZi/cvPc36YYpEiZ615EvvZ
 odibG/HhU9bUHGsJ3yzKJmF7FWQ5MJxKKALNYZ+Wc4DzUKK056LGHfIEmiUKKESvWLbSxFq1m
 P483EiiAc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_025259_922247_EA6F6951 
X-CRM114-Status: UNSURE (   4.55  )
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

> Introduce error handling in mtk_dai_etdm_enable_mclk to ensure that
> the function returns immediately if mt8188_afe_set_clk_rate fails.

* I suggest to append parentheses to function names.

* How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and=
 =E2=80=9CCc=E2=80=9D) accordingly?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.12#n145


Regards,
Markus

