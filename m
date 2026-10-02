Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B154BCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhNOry5SPjqFJfWAABwlECFJ8i+7DijkyXrg3YFBS0E=; b=CGulaDy1fKFjpWN3fZ6hD2unsA
	ab0fIHkJAYnUwZtmiWV3BWJ0baPw6ErkXpBRxgraj6vHWPlG8g1nMmBPjZVP8S71eJPFgC7BD31DV
	5U6kYggDJRf2aqPk1BovyjizGvUkzh0Bw/SZq8xO5Ct1PimOv0lDI0ASdp6HK6VbL70Bv2Z8HNRqZ
	ldvuulSdo5d4jTSmBv3q768hINdKunDxk2OP1pJ4cpi7TwXHA+3zwk+39MdRa2o3znYPH9eBJXJ5f
	LuS+ZkquHL+0YCWbZOKYSgWNMlsTgQJGDA2BqLUYnFiNCqNvEPR/SXPwttPsRJcXzwvc6+cygC8M0
	HvHkOUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb6h-0000000BRH4-48he;
	Fri, 02 Oct 2026 11:07:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCb6c-0000000BRG0-2OJj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790939227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=qhNOry5SPjqFJfWAABwlECFJ8i+7DijkyXrg3YFBS0E=;
	b=XTolgfBgpNyHXab8f+lqQQ8zMiwHXdC4Rozw2/evUzGSrR8YbfXQl94zCgynpDHoT73dcL
	op80e4OClsn/dgRVQ+c9sAHB2x5Mse72FQIBjqQEvvS1VSRu8TLSsDxlFiKRj1fq70pDC2
	M8bSw/PpYP9Lqw2pbWzaVdEjouYWyqw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-JAuyJ954N4G5pLDI7852cg-1; Fri, 02 Oct 2026 07:07:04 -0400
X-MC-Unique: JAuyJ954N4G5pLDI7852cg-1
X-Mimecast-MFC-AGG-ID: JAuyJ954N4G5pLDI7852cg_1790939223
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49e6862e924so60477005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 04:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790939223; x=1791544023;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhNOry5SPjqFJfWAABwlECFJ8i+7DijkyXrg3YFBS0E=;
        b=YErAkGi07hioTRfbcChZz/3kfQBecwOQoFvguuklZEBSkqXugMiAMTwOLbC+P3vvSZ
         Pj18CpzqYoBbN3CBvOFvnJ8R5BzLdSbh97drWFuFscJWwq2JklrrMwpSb1uR82+NLogO
         LuwMmhoMzHGfkYJXSj6uJP8esHjrhcMGBNCMbLNwG5FB/ExsLmCYLEyo8646YGFtTRHe
         wWHWBalu5hMt+T7zFn4jQDdEVGx9SuYe3r00TNUi6jwkz5y2ZK6eZJeaWmpM313mRLof
         HkcJpO6MkjCbweixtXMCy5igH4upFeBBncIjSiapl4yOXEqzZFWxODFtbA6p/rM11eHf
         Qauw==
X-Forwarded-Encrypted: i=1; AKwUvBySx26BYxzIuSJvHCFznsv/Hs0prAiAzKI/xvYJCLDM558fTmK4K7AaWyA/K9Ewc2bnuqfa+uQGFT+OncuF4FtU@lists.infradead.org
X-Gm-Message-State: AFuF++mPfAv/6lD3POz6x5AHa22H7e6f9FySJZ3ZPPWme6L3EvfWp75Y
	tEn+5Ml5V7NH7+UdTavk2rIEXTe2GvqKL4xqjGYisBZKjPLIIcjsVvTpBLgA1ko18xW0bkg2qYs
	jSxSSJH+CEJC8R9N5CFPSbGGRGgZ5WoUBot6hUw3KNhwjVFXr9ANkxqV273Kl0lm267oiiL8/JE
	vN
X-Gm-Gg: AYBFou3vOtbDeUQ1qlXVOa3kMPcYOWkptl7NEEi0xRrCp0Mt0eunwVeovOPFeZzgnPE
	ma90wzJ9VlmQIe+oS01lY03Y2YHHQbVO0irRmD5A2MsV5JUYrTkyZozYfSYpCo2pLG/Qppuqzax
	z2TQ2HnYEab6H087ypuGMlW8z2GPn03E2M2iPmKd044+0V6NxY/vggHMeHUecQufBgN0gDVGUk4
	lAj+yjMZSdfm8wU+6hSjvtzbSbGKb/3uP6r6XIOyE7S7oh2+ZEFo8b1oszFRnekHM4JHKJL7FM1
	AJ03bMw62jFBKr2Q1lX1nnqKo9NJLznwGdGvQAExXKPFG2rDt7kyCI7YDVOdyxCznU7p0EYc
X-Received: by 2002:a05:600c:6099:b0:4a0:12d7:4c88 with SMTP id 5b1f17b1804b1-4a0276edf8emr40618445e9.30.1790939222741;
        Fri, 02 Oct 2026 04:07:02 -0700 (PDT)
X-Received: by 2002:a05:600c:6099:b0:4a0:12d7:4c88 with SMTP id 5b1f17b1804b1-4a0276edf8emr40617835e9.30.1790939222263;
        Fri, 02 Oct 2026 04:07:02 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.115.216])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c6597sm75868355e9.9.2026.10.02.04.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 04:07:01 -0700 (PDT)
Message-ID: <2f158324-fc8c-4fee-bcb7-20f986938201@redhat.com>
Date: Fri, 2 Oct 2026 13:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
To: Joachim Vandersmissen <joachim@jvdsn.com>,
 Eric Biggers <ebiggers@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Vladis Dronov <vdronov@redhat.com>
References: <20260303060509.246038-1-git@jvdsn.com>
 <abTuFto8Tc3mhRRe@gondor.apana.org.au>
 <64592fee-1956-4a70-a751-9ac3335cfc27@jvdsn.com>
 <9926908a-5f08-43ba-99dd-b83c7067d52b@redhat.com>
 <83d09aa1-729a-47a2-a8e9-381c74e92f42@jvdsn.com>
 <48f12b65-428d-4809-9735-18876b09e759@redhat.com>
 <20260910141456.GA1936@quark>
 <e1d45f87-de65-4ff2-903a-80fd2c0b3861@jvdsn.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <e1d45f87-de65-4ff2-903a-80fd2c0b3861@jvdsn.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oystrJMyw2Vs_13q9JtF_gicONjw5Bk1hIBhG_584RY_1790939223
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_040710_780158_1C3E5041 
X-CRM114-Status: GOOD (  31.85  )
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

On 11/09/2026 04.53, Joachim Vandersmissen wrote:
> Hi Eric,
> 
> On 9/10/26 9:14 AM, Eric Biggers wrote:
>> On Thu, Sep 10, 2026 at 10:57:32AM +0200, Thomas Huth wrote:
>>> On 10/09/2026 05.24, Joachim Vandersmissen wrote:
>>>> Hi Thomas,
>>>>
>>>> On 9/9/26 9:36 AM, Thomas Huth wrote:
>>>>> On 15/03/2026 01.43, Joachim Vandersmissen wrote:
>>>>>> Hi Herbert,
>>>>>>
>>>>>> I don't think this one can be applied yet since dm-integrity
>>>>>> still uses xxhash64 through the crypto API. This would break
>>>>>> fips=1 systems that use it.
>>>>> Out of curiosity: Wouldn't such a system be FIPS-incompliant anyway?
>>>>> If xxhash64 isn't FIPS-compliant, nobody should use it for
>>>>> dm-integrity there, right? So I doubt that there are any systems out
>>>>> there that use fips=1 and use xxhash64 at the same time?
>>>> There is a risk that users may not know that xxhash64 is not FIPS
>>>> compliant and would still use it. Especially considering it was marked
>>>> as "fips_allowed = 1" for a while.
>>> So isn't that a very bad situation? They think they are FIPS compliant, but
>>> actually they are not since they use an unapproved algorithm by accident.
>>> Maybe it would be better to include this patch so that they are aware of the
>>> mistake? If there is really somebody running into this issue, they could
>>> boot once with fips=0, fix their system, reboot again with fips=1 and
>>> finally be really compliant. Sounds like the better solution to me. WDYT?
>> As described in the dm-integrity documentation, dm-integrity supports
>> non-cryptographic checksums for protection from accidental corruption.
>> That use case is no different from any other use case of a checksum.
>>
>> It's also no different from using crc32 or crc32c, which similarly have
>> fips_allowed=1 and this patch completely ignores.
>>
>> The solution is not banning checksums or making any other code change,
>> but rather just doing what it seems everyone has already been doing:
>> documenting in their FIPS security policy that checksums are only for
>> use cases that are not "security functions".
> 
> Unfortunately, this is not an option anymore due to the opinion of the CMVP 
> that was issued back in March. If you have an account (you can sign up for 
> free), you can read it in full here: https://cmuf-workspace.org/Products/ 
> Projects/Messages.aspx?prjID=3&id=559. I can also send a copy of the PDF 
> file privately, if necessary.
> 
> The relevant text is:
> 
>      1.a. Can xxhash64 be used in approved mode as non-security function 
> without any further action (in this case FIPS IG 2.4.A will not be applicable)?
> 
>      Answer: No, xxhash64 cannot be understood as a non-security function 
> because:
>      1) It is offered as an equivalent hash alternative to approved hash 
> algorithms (i.e., SHA) using the same interface/API and therefore appears to 
> an operator that it can provide cryptographic protection (i.e., security).
>      2) Its return value (i.e., mode indicator) is the same as for approved 
> cryptographic functions that provide security.
>      3) It is accessed by an interface/API that has “crypto” in the name and 
> thus implies security.
>      4) It is an available hash function (i.e. PRF) of HMAC, which is a 
> keyed algorithm that implies security.

Ok, thanks for making this clear. So that means for FIPS certification, 
xxhash64 *has* to be disabled in fips_enabled mode, right? Thus every distro 
that cares for FIPS certification has to include this patch. Every other 
distro doesn't care for fips_enabled anyway, so they should not care about 
this patch whether it's applied or not. I.e. there cannot be any user who 
uses xxhash64 in a fips_enabled system (unless someone is masochistic enough 
to turn it on with an upstream kernel in a environment that does not need 
FIPS compliance). So I think we really should include this patch into the 
upstream kernel now, too. WDYT?

> crc32 and crc32c were not explicitly called out in the resolution, which is 
> why this patch didn't target them. Though following the same rationale, they 
> should also be disabled.
Sounds reasonable to me, but maybe this can wait 'til the CMVP explicitely 
asks for it?

  Thomas


