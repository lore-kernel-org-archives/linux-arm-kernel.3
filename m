Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 899F7CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 13:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FL1qdsJdYlTPhxXhO1xYRX1SdNE4oOgS41cv9EJcUJk=; b=u6PTXXkFGVZbYe5pOhPVkOkBn8
	kluFqfDIw87A9b6307sIb4gze6ZUSX4zYch1V4SYzPWfBrKdD/gGuJVRaBIHs/mzCYMRWB1tq8hKm
	79W+i/Lp5+G4o9VgURIEeNFcWKF3eIDWL7X6SLRRndDBfmGnXISqxDTmPB4A/KHkcGBQpExZsgia5
	YsikWNOR8KHdoMrP17TYcBuFLkDSh7xF3tu8A2tl5qZxBHeWwUvFEzWx+X6ZrHyLLK1QJziHhsL7w
	9vLnwpqsyTBxqNZqi4Ie/FPnE6oP8kb0Qo7f0/mg/OOpkhn3H7HSJX5ezH1VbJ7aEIzZxlxtXYbGI
	CxhvIK7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojJK-0000000Duu8-30a5;
	Wed, 20 Aug 2025 13:57:07 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiOG-0000000Dgdx-2SIk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 12:58:10 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1755694683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FL1qdsJdYlTPhxXhO1xYRX1SdNE4oOgS41cv9EJcUJk=;
	b=uqd944jumwt/OqCvrVikg2k18gKD+hcC10wE87TN4ey5hS2uK8bgYIg3dpnF6NIMrNcmc7
	Q3G5w+hq+EgOo0wO5XkHwJ/vsZS16lmFs0aB/ILxGoLeBqQPLP6c2qW8H1GrWgA6rTYPU6
	Eu5Bsi3EVMgzCRqC5FVUoV2+l9dcW1KWE37xCSFvHiMkWMEcSFx7EsobzETUGxvrJHSdM/
	/Y2Ne0v8pKyuEJhokVgbYlPk+KpAF4rMKJTNSk8B21YB0PmFRr5bb8wViwpAWOj/JdyhZ0
	nyiC+P+5A5pB4dAlwYgA4KYBwCN90mgm4I2kHk6t/v0jzB8ydbQOZF4QZDfXbg==
Content-Type: multipart/signed;
 boundary=f312b39eb8656774e4bd11dce79ebb120775cc336f024edd6bee753f42fc;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 20 Aug 2025 14:57:51 +0200
Message-Id: <DC79THC2NMDM.1BHGJPJHTYPTV@cknow.org>
Cc: "Ingo Molnar" <mingo@redhat.com>, "Peter Zijlstra"
 <peterz@infradead.org>, "Juri Lelli" <juri.lelli@redhat.com>, "Vincent
 Guittot" <vincent.guittot@linaro.org>, "Dietmar Eggemann"
 <dietmar.eggemann@arm.com>, "Steven Rostedt" <rostedt@goodmis.org>, "Ben
 Segall" <bsegall@google.com>, "Mel Gorman" <mgorman@suse.de>, "Valentin
 Schneider" <vschneid@redhat.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "jstultz" <jstultz@google.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-rockchip@lists.infradead.org>
Subject: Re: [RFC PATCH 1/1] sched/deadline: Fix RT task potential
 starvation when expiry time passed
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>, "Kuyo Chang"
 <kuyo.chang@mediatek.com>
References: <20250615131129.954975-1-kuyo.chang@mediatek.com>
 <CAMuHMdWZHwr_nmMbVREKC9nQCYigT_gvKH3M9v+oyYqk6FLONw@mail.gmail.com>
In-Reply-To: <CAMuHMdWZHwr_nmMbVREKC9nQCYigT_gvKH3M9v+oyYqk6FLONw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_055809_338446_BBC58C2E 
X-CRM114-Status: UNSURE (   8.42  )
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

--f312b39eb8656774e4bd11dce79ebb120775cc336f024edd6bee753f42fc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Jul 30, 2025 at 12:06 PM CEST, Geert Uytterhoeven wrote:
> On Mon, 16 Jun 2025 at 14:39, Kuyo Chang <kuyo.chang@mediatek.com> wrote:
>> From: kuyo chang <kuyo.chang@mediatek.com>
>>
>> [Analysis]
>> ---------
>> The log "sched: DL replenish lagged too much" triggered.
>>
>> Signed-off-by: kuyo chang <kuyo.chang@mediatek.com>
>
> Thanks, this fixes the issue I was seeing!
>
> Closes: https://lore.kernel.org/CAMuHMdXn4z1pioTtBGMfQM0jsLviqS2jwysaWXpo=
LxWYoGa82w@mail.gmail.com
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

I was seeing this warning as well on several of my Rockchip based
devices, but that is gone after applying this patch. Thanks!

Tested-by: Diederik de Haas <didi.debian@cknow.org>

--f312b39eb8656774e4bd11dce79ebb120775cc336f024edd6bee753f42fc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaKXGVQAKCRDXblvOeH7b
brWcAQCUmEK2dQiUw8567AElKttA2Xw1XSBJji4KjZ0aIcOkqgD+KJh6ivSpDeo0
sE85VdYRU6hAT+Uh8u65OcOlnN6feQ4=
=riNm
-----END PGP SIGNATURE-----

--f312b39eb8656774e4bd11dce79ebb120775cc336f024edd6bee753f42fc--

