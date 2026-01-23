Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB99D778BD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 22:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:In-Reply-To:References:From:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uq0Bbktbk8y7WGuikPOCqhYRMF8Z5/AnUPjwZmM3BjA=; b=xfEtvXe//7OpNr2L09XOpAWlvI
	tA8J5e93VCC4wKzVjHn2jfpVQfJwj4X1KphcLmWqXb4igUAp0H5ty6pgzj+zS3pQnaSufQTjbEAoq
	7qWa2+QCCtaLqftdAn/KRbrkKkkuYW5DUeEnMPmnjqxqmSnY2pzaBqpwJ3xyutjOcJs1arz3G7otw
	mi18QEH+lRsbXSjNDddDDJj408xsCXqrSNk8xD1iepPiyn4g0VFO185K5q4J9hnA/dajcPn7Rbhh3
	iuaytYPCiQbQlPX1UOOEaL8dG8Id4bos06qSdDuOzrAep7rvTWIjuu9z9aI17009h+nIjFFctbZ8/
	+OqYKwcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjPaZ-00000009YFo-3bSQ;
	Fri, 23 Jan 2026 22:25:11 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjPaW-00000009YFN-2zd4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 22:25:09 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-649523de91fso2247764d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 14:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769207107; cv=none;
        d=google.com; s=arc-20240605;
        b=MPpSZs8THx6hpbd6a5v0D/LyXXXGe7W1m0nLEP1VeuXvHbb9lzPA4LAg2aqsZdbrUp
         RiRyUk/Lcq0Rmh4t0o/x4P2vSlqLu6ecVUZEG3xdrxmLW8qEeZ9SB3ksY4sNZ40Oup3H
         AqjFwqoRKAouROP9oy646HcbA+FXIhshknAVxa3YhIQOHFw36SCiQYkBKpj9Kr8vz0j0
         U71ya2M5mX1EvAb0VsnSiQbZQF8v96V7fVpRQ3ztGG0waEvVCAlPh+GUZi39joQ5wr7a
         +ZIGvjPwz19NSLQSFf5xR7u9eagwlbf1IBCYScTwZbcn+IGtED/XbuHVUgH80gLKqzxO
         HSxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:dkim-signature;
        bh=uq0Bbktbk8y7WGuikPOCqhYRMF8Z5/AnUPjwZmM3BjA=;
        fh=b/lb7AANd9vnii4f5+ynpkAwM3JRcRLSzAsDIqQ1U9g=;
        b=LL3cyvyS9oZTaUn7XiAB69//5wna8BuUeLyxAdzHTfTef+gLgqokMXl2wXuznPzU8L
         K0+DC5At7K6+6CH5XnXy51lYMNn8pTwTyhRvABOn2VVsAoDwk58lxbZwSk4hNu+/odo8
         EegE4Fl68aCQas9h3TjJlD0eizDHYEktZmZR4Jn9YqzBuG/Dmg/ExaDK12W1bqOiFSTm
         SimvnCJ1z4xilL0U/SZDaUS+Lh6E85CbkdM8kJYqlIRvdn7oI4XX+QwEwVxzn3C6whoU
         OugzDV5WbfadpnsqQXAFk521EKtX1OxpTy4ZeeJNhqgk6ntCB2E87AAtJzUF4MJBXxXj
         bDQw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1769207107; x=1769811907; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uq0Bbktbk8y7WGuikPOCqhYRMF8Z5/AnUPjwZmM3BjA=;
        b=g8VqSl/Qs/v5MGWHhtCg8ENI2rRoAkLLQQRVMdKc8GAV0XUcndS5ukkBWtsMUE+4s6
         fWYJoVj15QRsdkJnVXE9B8CvDq7essLzhGbvbMEQ7RkfkTQrfr7QdAdvfcgn+DtAhyKi
         1DnEBcvk5Lg2fWaEdq35uB04JziSKBBpXbfNm/vOIHffH3TdSlfpIscbcMnF/SBcP8Fc
         YViIOj+ykhGoPzFIC9T5gM+RmZobht5VFXjpzrkncqsCYW/XgAAijcJxeaAcbswVlgEr
         hhmgUSgZGnGItUW+2Malpb45RDRHT2onLlrvzJRs5BKl76uli8SrkOP+hu8QCb/UUV43
         CueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769207107; x=1769811907;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uq0Bbktbk8y7WGuikPOCqhYRMF8Z5/AnUPjwZmM3BjA=;
        b=mh0NXmbAfwfO68POLVbvIKVcXsIEpDTYZMNiVFtDOt5Q+wB2eWcpcdK+Xtq3juEfj7
         DkDJR3+NsxqG6/SUUs4ifnGglfK4RiQZ6naNhwTKcV9yDWgEvnHXJKvaxZw4e8u2efuK
         TN54FqQ0ii5BwYpQ/wubAUQYT5JD5KKFKGeSFzpTpPT7YGIIH4Q9lCYzBsQ1Ce0geHTm
         G63dJWILLpF+zsZaz5ctM+svBsJNO6zalr1Q6xn9bQvRZA8wA5/pRn6N5blruV/8t3a7
         sbj/vSdglJHc1z4wvfAPY+o3ocgx/JBFhrzk8NIVX5v+Gsx1kLDby8vKdL0dkCcEm9iw
         +Dyg==
X-Forwarded-Encrypted: i=1; AJvYcCXAnnRUIxZFWaNPmqHmOhEDnkGONiKeokFwaVE+ccT4p9WilJ4GSRBPK5kOP+95SO6+y4gACzGAjRB2UjZ7v0Tn@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy74bFTYYcMbvgNjgLNc9ciB5vOQp3hxhY6Vc9rJNEbrzdmper
	7zYUKvT8Qo5bqDh+lJtMNvCvDVCa5RCbbZDp8LwdUL0P2Q5/z5vpUIGG9zpOJcAIMfFZ8uETLTZ
	7UTIJe78mE/X/lBB6sVcDiEVRqOy/ohtS6xcijjUMcQ==
X-Gm-Gg: AZuq6aLY6ksgOBjl3LCHb1CTbRsOhJLkSjCq+Kj0JfOvI2fmziFSUI+k9CeWGuiMCIi
	A1SSb7XUR1eh++n7gP+AENOnNL/9h7NKEMR5qd3WsHiHe94JBcaKqqNCOH30zoA5VkYYCR0zm93
	WSwoA9qkAORcSfeFFQX+5CGeBT/oOXMVFVQS1otM6NKCV1rzK0wBD4D5S3AAome+fO1CPLjK0G2
	pjhXQE+ueDDxMeycqEurmLiI5sJaqPg3dXuh2tifDzkpdBNpMQ5FqMNfJMcNsq1LuXUyfCE
X-Received: by 2002:a05:690e:4146:b0:641:f5bc:6984 with SMTP id
 956f58d0204a3-6495c0291b1mr3421254d50.80.1769207107135; Fri, 23 Jan 2026
 14:25:07 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jan 2026 17:25:06 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jan 2026 17:25:06 -0500
Mime-Version: 1.0
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
 <20260123-i2c-xiic-v3-2-eb7cd4254dfb@nexthop.ai> <efe4e155-e307-481f-8332-783cca8a098a@lunn.ch>
 <CAGYn4vz3YuJ251JZFk7M=wsJr=bMY0Wq7x4Er=mjS_spyT5jLA@mail.gmail.com> <df4e0611-ce76-464c-be01-e3802b04877f@lunn.ch>
In-Reply-To: <df4e0611-ce76-464c-be01-e3802b04877f@lunn.ch>
Date: Fri, 23 Jan 2026 17:25:06 -0500
X-Gm-Features: AZwV_Qgn9XTijMwGH37i_MRyx6zWVhVWzL58EFtO9uJwNOMjVACM4iIsDuD-mAk
Message-ID: <CAGYn4vwg5pk4-HaO6_RXq9e4cC0oHBNpBBuLyXJ7zRLoP=gokg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] i2c: xiic: switch to managed version of mutex_init
To: Andrew Lunn <andrew@lunn.ch>, Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_142508_771362_D3642F12 
X-CRM114-Status: GOOD (  13.75  )
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

On Fri Jan 23, 2026 at 9:36 PM UTC, Andrew Lunn wrote:
> On Fri, Jan 23, 2026 at 12:20:54PM -0800, Abdurrahman Hussain wrote:
>> On Fri Jan 23, 2026 at 7:22 PM UTC, Andrew Lunn wrote:
>> > On Fri, Jan 23, 2026 at 08:02:45AM +0000, Abdurrahman Hussain via B4 Relay wrote:
>> >> From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>> >>
>> >> Simplify the error path by switching to a managed version of mutex_init.
>> >
>> > How does this simplify the error path? You don't remove anything from
>> > the error path.
>> >
>> >     Andrew
>>
>>
>> Thank you for the feedback. In v4, as suggested by Andy, I introduced managed
>> versions of the pm_runtime_ functions which do simplify the error handling.
>
> But this patch is not about pm_runtime_, it is about a mutex. How does
> this patch make the error path simpler? Please make sure your commit
> messages are accurate.
>

You are right. In the case of mutex there was no error path. I should have
worded it differently. In v4 pm_runtime changes were added to the same
patch, so the wording might actually be correct now.

