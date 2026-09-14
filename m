Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734D0C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+fAaJ5qkCaQLPuEmfau0ZxQbepwRl0/kqTfAwPSAgY=; b=maw9DONcHctqJTKK1cnchSiTGZ
	7lk+uhWdvtYYAOCbHpe7sQ84ZST+tfeER8NrHguNRBv0lzFbshdAh7485CK/4UtWG/qZixWZM+Gla
	7WJclEpoN2mEmm8VPMN0SG3KSsKt3jQKCMq4jH8wlPUkrkcEFQ0vGJrcQIEZKi68Kxxh3ijVGVSat
	NbmICt15DhepD7To9c0LHcuAPmvCS+eD2F5Qnt2KbaynJ2JzvLtAn7eTEXBPiiECcAfBEycd9nvaC
	7OXRjDJAxAOxM6lMKGa9LIt7e6lYY7jTwtgi//inOeE/7UJDc9BVnRfqQPY7Qqe/ZOiKD3nwzyEww
	f1VpX0YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62kg-00000002sa9-2Lbk;
	Mon, 14 Sep 2026 09:13:26 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62kZ-00000002sXJ-1crg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:13:25 +0000
X-QQ-mid: zesmtpgz6t1789377140tc3f78b20
X-QQ-Originating-IP: LDMhUITzf0XHH8szfl2GgtewjXa1MG6TG/bhQ9ClylI=
Received: from [192.168.21.56] ( [111.8.45.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 14 Sep 2026 17:12:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9772511462456153291
EX-QQ-RecipientCnt: 9
Message-ID: <A3EDECF27FC3B14D+76412d42-a289-48ea-a505-4eb06c8ded85@kylinsec.com.cn>
Date: Mon, 14 Sep 2026 17:12:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] rtc: ftrtc010: fix resource management and integer
 overflow
To: Linus Walleij <linusw@kernel.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Deng Yingchao <dengyingchao@kylinsec.com.cn>,
 Qin Yungao <qinyungao@kylinsec.com.cn>, Luo Qiu <luoqiu@kylinsec.com.cn>
References: <20260827021054.0963C1F000E9@smtp.kernel.org>
 <B61B30904C7ACEEF+20260827080320.3351155-1-liudalin@kylinsec.com.cn>
 <CAD++jL=s_dyCyaPCHhQttukZ7m8hFMpCGm5hATrHUBirEG+RxQ@mail.gmail.com>
Content-Language: en-US
From: liudalin <liudalin@kylinsec.com.cn>
In-Reply-To: <CAD++jL=s_dyCyaPCHhQttukZ7m8hFMpCGm5hATrHUBirEG+RxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NmVMiHSBBXNG0AXGKKMYx1VaGNtAmVkZxv2b/5TlinN4UT72DDIVkAvN
	ETWwBWa0zWNbx7QgIJepSfIKM2zc52A0mCPRvJCtUE/d2NBMugz3hIv6Jsc+ZyBrJye0ZIH
	STs3z4S8PCHbc4m0N57kHVd36XdFWDWZpL/i7WXeC5sIylmO8DtZpC3PlNa9OJkB6T7u2t5
	itfvZt6GGJqu2wjiuU9vXCl/vXGZF0BpWIJ0RpzyGXKMsCA2qUCkmwL97zN9iPut86mFCdI
	oM+cwzzbPp4Za1cvisfbh+TWuHIcxICeA/biekEMw9+KQ3WKUXTGYBIxepAAbjQyssWXCUs
	/OOc1KtK1gTrOTDeWXabczBmNkeVRjF6firvgldTGsb8Z2WVhKmWUbz1jCVB+5qHPaWtDC6
	n2uSTX31ECrM1YtgblJT5Zr33wskDjnPO4EosAXmQMD3UxkehVFZUCT2HNgPQxae1wIxjyJ
	q2Ik3KbkY+YypMPLSFtahO+9LzOR2dSoHDlHL/En/wZz4GynByJXJoQz3zQ3XjApiDEOOf9
	lx4LsYi8foxPDoDAVKUOkDfw3hTyTb/Y/5HtFU6dxkhhl6OwUqVteTw+y9btLa1HRauP/yi
	BSLhg9swKj/CTiRiPVw2icLyvFT7k/J8PAElXFxmIO61jid/hqA4zfWpafJBiZrQlnwXsS2
	wpjotjFQdHoFKOUK1JC+iYDWE/RbAOzbpXc2CAxAFtITf+KKv2ZVaMf+gzZabu8Z5LQQs3U
	p4ya6rLvgGQkYOkfEsuqbQqw7zZ4VSA6pb38muDfpSrY7iVJ42LIUR8W7L97j5lZt7TeOmW
	LZAD2nnAOVRt7I9chhvT7aSLmyMvj9dN7kgYHgBLu4As8r6v6t5Ge/gWwkoCXpU2NUKuZSH
	mOG3+AS4QiDen7/3LwXAEWuk1c0Cew5cQxak8Pyks/0m5kDwBTyBvpzCl+NsBqvIAi2Cx+k
	n/DHMk4HnJ0c/viwrptcc+TfYGbPZF7G0P2THAGotPZykIqF48Jd35axo1I7+Po+tZEQjiV
	0QDaTWiW8j/ohy2RY4eWg4kBYMMuK2yhnNpEUDJINhTmLvNN1JEv4TMRZ8MfD322CNSQjFQ
	GqlkN3LFBFLftX9eRaiP5DfFKWrMFSmlX6w/lf6kfzMzwrRhbUcwpw=
X-QQ-XMRINFO: OD9hHCdaPRBwTrk1PRwzX5abbeVq+9uevw==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_021320_690957_BEF5BDDE 
X-CRM114-Status: GOOD (  10.22  )
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


在 2026/9/14 16:38, Linus Walleij 写道:
> On Thu, Aug 27, 2026 at 10:03 AM Liu Dalin <liudalin@kylinsec.com.cn> wrote:
>
>> This series fixes three issues in the Faraday FTRTC010 RTC driver
>> found by Sashiko AI static analysis:
>>
>> Patch 1: Fixes a clock resource leak when devm_rtc_register_device()
>> fails in ftrtc010_rtc_probe().
>>
>> Patch 2: Replaces manual clock management with devm APIs to fix a
>> use-after-disable vulnerability in ftrtc010_rtc_remove(). The RTC
>> device is registered via devm_rtc_register_device() but clocks are
>> manually disabled in .remove() before devres cleanup, creating a
>> window where MMIO reads on clock-gated hardware can cause a
>> synchronous external abort.
>>
>> Patch 3: Fixes integer overflow in ftrtc010_rtc_read_time() and
>> ftrtc010_rtc_set_time() where u32 arithmetic wraps for dates
>> beyond year 2106.
>>
>> All three patches are based on v7.2-rc2 and have been verified
>> with checkpatch.pl --strict.
> All patches:
> Reviewed-by: Linus Walleij <linusw@kernel.org>
>
> Maybe they need rebasing on v7.3-rc1 or maybe they will just
> apply cleanly (I think so).
>
> Yours,
> Linus Walleij
Hi Linus,

Confirmed: all three patches apply cleanly on v7.3-rc2 using git am.

Tested-by: Liu Dalin <liudalin@kylinsec.com.cn>



