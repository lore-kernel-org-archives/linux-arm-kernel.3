Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0BACD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 12:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DRyUFBv2XaY0azYCRWvAw2BmMROHRiJQM5iOAaN1NXs=; b=TaEfTS/oJYvqHoQh7SVarPUhD0
	h+B6bRjMMH0v46OlnWjmv9Vl8jWG+hBsM8oqacQj5u5WCdfkBvXIwDcILoOXZ1TLV1Acdj0JgvG+E
	DVPcQpBktZ8T0SYIJOJeS3zOgTyK8dW0rD3w9PWhRADNoiXnMyoTyoKOidqFQD1h50/23onwoX7qm
	wbXsKIUJ5E5ET5cNBgXb0vdH4Y12d+HNAT5qq8appLtlV7KLTqVtmHHFyt/lfOJVOM8vUYabH9rtD
	2QxNBXdJeH8suf4MsNZRZ5dUqahpbdTiIH7aF8RhzB5aj5TfzwfohRJZs32lvmco+/ZHxvzbz2amm
	HJd4p2Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1Sh-0000000B5iL-474a;
	Mon, 01 Jun 2026 12:09:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1Sg-0000000B5hy-1kZG;
	Mon, 01 Jun 2026 12:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DRyUFBv2XaY0azYCRWvAw2BmMROHRiJQM5iOAaN1NXs=; b=Iqv2dztrytFwsjnulVNFfl6Ojh
	DamOczZTV7wtxBq035Alp4KRUIu75q6RkaOS/sYbRTVkRl5wlKCQWQK0Zb6KckoXdFzTC5Zzx9Sa6
	qwPZze81u+u9lCRx1X5+IJrozr6+ayW63eCt0N3eSklbZ0njkDmbI+Swx2hbgrYwPbiaqyoy1+Nym
	GM4yvOx/d2/406rYthFaEbLb54fyQWp16PZpCceX1zMxJ1hf42Bm5yYYhsCBDt8xocJXfNu50UUAk
	r0OBRpWkH+c2vFrYjJC+KXeC7QcmKOZE8Atz/e7xd54064w2TTiqeVEe8kAkz/AcDQ1I40McINAAQ
	NEcW9uNA==;
Received: from nbd.name ([46.4.11.11])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1SR-00000006d5D-46fz;
	Mon, 01 Jun 2026 12:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DRyUFBv2XaY0azYCRWvAw2BmMROHRiJQM5iOAaN1NXs=; b=CdaAcBgwM1UMoq3B/U4/q3/Ufa
	T5Yn3bnwf45EMCwPEKKqv3S6+UIsm51XnN33zwSlGrUtEuqCASwJgSlA010A7ghzgeQazKC86KXWh
	QkHhXcB3IZBIT26inKj6KJjq0qUQyAV3e4m+lXACNusk95UgCt5b+yBh3s2To2Q07Doo=;
Received: from p5b015753.dip0.t-ipconnect.de ([91.1.87.83] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1wU1SD-0059DS-0g;
	Mon, 01 Jun 2026 14:09:13 +0200
Message-ID: <fadec8b5-c3c0-41b6-a1d0-b31c4ae19fb0@nbd.name>
Date: Mon, 1 Jun 2026 14:09:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mt76] wifi: mt76: mt7915: configure noise floor reporting
 on reset
To: David Bauer <mail@david-bauer.net>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260516144944.2574053-1-mail@david-bauer.net>
 <a83c9aca-da9e-4a5e-a364-382910388a68@nbd.name>
 <370e76e3-1d41-469b-8e50-8ace6b5622d2@david-bauer.net>
Content-Language: en-US
From: Felix Fietkau <nbd@nbd.name>
Autocrypt: addr=nbd@nbd.name; keydata=
 xsDiBEah5CcRBADIY7pu4LIv3jBlyQ/2u87iIZGe6f0f8pyB4UjzfJNXhJb8JylYYRzIOSxh
 ExKsdLCnJqsG1PY1mqTtoG8sONpwsHr2oJ4itjcGHfn5NJSUGTbtbbxLro13tHkGFCoCr4Z5
 Pv+XRgiANSpYlIigiMbOkide6wbggQK32tC20QxUIwCg4k6dtV/4kwEeiOUfErq00TVqIiEE
 AKcUi4taOuh/PQWx/Ujjl/P1LfJXqLKRPa8PwD4j2yjoc9l+7LptSxJThL9KSu6gtXQjcoR2
 vCK0OeYJhgO4kYMI78h1TSaxmtImEAnjFPYJYVsxrhay92jisYc7z5R/76AaELfF6RCjjGeP
 wdalulG+erWju710Bif7E1yjYVWeA/9Wd1lsOmx6uwwYgNqoFtcAunDaMKi9xVQW18FsUusM
 TdRvTZLBpoUAy+MajAL+R73TwLq3LnKpIcCwftyQXK5pEDKq57OhxJVv1Q8XkA9Dn1SBOjNB
 l25vJDFAT9ntp9THeDD2fv15yk4EKpWhu4H00/YX8KkhFsrtUs69+vZQwc0cRmVsaXggRmll
 dGthdSA8bmJkQG5iZC5uYW1lPsJgBBMRAgAgBQJGoeQnAhsjBgsJCAcDAgQVAggDBBYCAwEC
 HgECF4AACgkQ130UHQKnbvXsvgCgjsAIIOsY7xZ8VcSm7NABpi91yTMAniMMmH7FRenEAYMa
 VrwYTIThkTlQzsFNBEah5FQQCACMIep/hTzgPZ9HbCTKm9xN4bZX0JjrqjFem1Nxf3MBM5vN
 CYGBn8F4sGIzPmLhl4xFeq3k5irVg/YvxSDbQN6NJv8o+tP6zsMeWX2JjtV0P4aDIN1pK2/w
 VxcicArw0VYdv2ZCarccFBgH2a6GjswqlCqVM3gNIMI8ikzenKcso8YErGGiKYeMEZLwHaxE
 Y7mTPuOTrWL8uWWRL5mVjhZEVvDez6em/OYvzBwbkhImrryF29e3Po2cfY2n7EKjjr3/141K
 DHBBdgXlPNfDwROnA5ugjjEBjwkwBQqPpDA7AYPvpHh5vLbZnVGu5CwG7NAsrb2isRmjYoqk
 wu++3117AAMFB/9S0Sj7qFFQcD4laADVsabTpNNpaV4wAgVTRHKV/kC9luItzwDnUcsZUPdQ
 f3MueRJ3jIHU0UmRBG3uQftqbZJj3ikhnfvyLmkCNe+/hXhPu9sGvXyi2D4vszICvc1KL4RD
 aLSrOsROx22eZ26KqcW4ny7+va2FnvjsZgI8h4sDmaLzKczVRIiLITiMpLFEU/VoSv0m1F4B
 FtRgoiyjFzigWG0MsTdAN6FJzGh4mWWGIlE7o5JraNhnTd+yTUIPtw3ym6l8P+gbvfoZida0
 TspgwBWLnXQvP5EDvlZnNaKa/3oBes6z0QdaSOwZCRA3QSLHBwtgUsrT6RxRSweLrcabwkkE
 GBECAAkFAkah5FQCGwwACgkQ130UHQKnbvW2GgCeMncXpbbWNT2AtoAYICrKyX5R3iMAoMhw
 cL98efvrjdstUfTCP2pfetyN
In-Reply-To: <370e76e3-1d41-469b-8e50-8ace6b5622d2@david-bauer.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_130928_545612_06140EA2 
X-CRM114-Status: GOOD (  15.88  )
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

On 27.05.26 19:05, David Bauer wrote:
> Hi Felix,
> 
> On 5/27/26 15:56, Felix Fietkau wrote:
>> On 16.05.26 16:49, David Bauer wrote:
>>> When performing a full system recovery of the MCU on a dual-phy
>>> platform, band 0 (usually 2.4GHz) stops reading correct noise floor
>>> data.
>>>
>>> This is due to noise floor reporting only being configured correctly
>>> for the second device PHY.
>>>
>>> Configure the respective registers correctly after restarting the MCU
>>> firmware to fix reported noise-floor values.
>>>
>>> Signed-off-by: David Bauer <mail@david-bauer.net>
>> Have you considered clearing MT76_STATE_RUNNING in mt7915_mac_restart instead?
> 
> The call to mt7915_run is guarded by MT76_STATE_RUNNING being set per-phy.
> 
> I think this is to not start the second PHY in case it was never started due to
> it not being present. We could in theory remove this check for the primary PHY
> and clear the flag prior calling mt7915_run.
> 
> This seems a bit more hacky to me. Alternatively I can also refactor the entire
> mechanism to make it easier to understand and resolve this indirection in the
> process.
My suggestion would be to do this:
start_main = test_and_clear_bit(MT76_STATE_RUNNING, &dev->mphy.state);
start_ext = ext_phy &&
             test_and_clear_bit(MT76_STATE_RUNNING, &ext_phy->state);

Then using those as conditions for calling mt7915_run in 
mt7915_mac_restart.

That way the special case in mt7915_run disappears and the behavior 
becomes easier to follow.

- Felix

