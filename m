Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DF9D778B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 20:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:In-Reply-To:References:From:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fOLtwIvEzSJeTJDxSVUUCF+YVxNJQUiDB9WDvPnOGm0=; b=yiHVaUA6L55kkCbyA0VGDEO/PF
	cS44u9cnohmux+eHEFzNhq9oalDyMtdSER38ghN9l7Fcjl31t3ySET4DpuC0RxmvH+yET2lvJhF4I
	IeBSFyoyfM9A4w+Y1pnk7fa4R4vo3GTrWbQGgc2COI758SjiOZ0iY5hf4FPoApoHwOy3lA1QljnJC
	Q/UPMA9H2MJgoVRuIMUSwoc2OAkDM6mDmn20Y6fxBeJMX9bs++JsPjL2CcYMQzuT71WPKzplF7oI9
	Q3I3iRDCx2uWTUdCYApp2mJVcGMFQMqaIXtxcKGwVVlRhgDZHSyfRSJEcRB3/EaGEpEL3zT5Rs/nW
	w7beqC5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNeM-00000009TgS-3lps;
	Fri, 23 Jan 2026 20:20:58 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNeK-00000009Tet-12eo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 20:20:57 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-64960418d46so852232d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 12:20:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769199655; cv=none;
        d=google.com; s=arc-20240605;
        b=ibLxmdf24eblGPDDT/Vq9oWIMOYT4tZHRwPb9z1lv1svTtT6DvwUU+1ZnyGesFesPn
         W+uzjKsqZuAsYDm5WKWNTvCZoz8l8H56Ylvi7OMIBH9T+yWglM2nwknCCi6t3lnVyvAb
         xDABgr/TWKRii8IIULJR6kc/QYhwXrtD9HSow1jlxuNFylaz1LpyQzC28Bjo5K1GIV4+
         5xM3IFxMQwUOHsgWoRzZyZee1u+0TmJOPFZ7/BzMqQ03fMtGCiHiPY9V7KFyNco95mLL
         LMK9oH+sPx71Y4Ntr/pn9/6DT55HcHJpBc/hdlN9yw9teshh0TFAvHp4tR3x6P20ziwc
         bs2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:dkim-signature;
        bh=fOLtwIvEzSJeTJDxSVUUCF+YVxNJQUiDB9WDvPnOGm0=;
        fh=Ae2f6Xmwr8YEj5Bp4VoQ/4xvChvUD23CYtj2kyuI1gA=;
        b=BQGnqiZz/Fcuyf/AQTbI34lRKw75hXmsTd8mfk+ebwfDBv/ro9KpBPa6AurDzAeoZ4
         y82Q7iMuhpQfvxw17+EtOLrTp0W8ZdMXnEJyDhrA0S7qkRU1fDiKpHeNUEcOsS01+Rjb
         bNFDse+jr92258aGGdqxQ0YX7BjxP9BgWE9MXcudrWEO0Q8vQDCy58PN1Zl16xlcAmYl
         miMJR9KtYIBsjPIUR+SOupLpMADWDsvJ93qpYmXRAWpQw0RUCD1wGvn5o9XD8eH400/A
         s6XHNi829dFOSRDU/DA2E9S+yoi4X0IByqDAjal8Qo8ck/DFUhvtKa5SgvHmIgss21Ly
         wLdA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1769199655; x=1769804455; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fOLtwIvEzSJeTJDxSVUUCF+YVxNJQUiDB9WDvPnOGm0=;
        b=YLuWLgPu8Y3bwCKQs42Ritikhr9EmEG+0OLpzbDorYxvxozkOdJkkJ3T5iL6i54y5+
         iUUEEFHPhX0yXagzQ6x05sXpPnQ5aU4kjFk+9UAfZYmhAyHFiSHC8qGGk2ttVxERCo77
         D6dnCfevSsG2bXIHei+RFiYsbjzFDc2JDJPzx5CqO5aZBqeiOtaDeOSDyXEGqBjCg6wQ
         pGMK1KM+tmc9DbTdQqrL9+F91p8/q0NPpOmHomQZ5ZQPjkfdgCdH1zhxnE8urQ2fN+ku
         0DryWTYqkSD+5u6KqCabWqueLk9b7GOoW0owM+j2LVuD39anfdwr9L9PNqOuch2/bPTP
         +1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769199655; x=1769804455;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOLtwIvEzSJeTJDxSVUUCF+YVxNJQUiDB9WDvPnOGm0=;
        b=MsUPvqmf0tTosFPJdLwuPOQye3O7qYMSM4twW6ysNXuYOL9h7MMwIMQbzeAg0N98bk
         WeBZKkT+0vDU18iNpuNQvjF+uuWfiefI9+5j1Lp+Ol8g24jah1jnYx9XQmvMstiHlOg0
         nvfzmcxrrENo8cLdlmuMuYbnQsoD9X9Karcg9X03vns+sB5pdPrZc7fDFTvhjS7Rnk95
         3hUKHS/Y+ieyE2icS3A8tinAAXLDqCyOJvGmVbaQ4HNOfSOP96NgifU86k2pAUOx1KML
         P4rKxh55YMhcF0it/nEvLvs+h+wu3RETEu9vCCdkQoN/EpVSzMkh0zZQfZVcBM2BMZSm
         Q6AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7YCyFennzbIlcJou3D6NGXjUZy6XcSX2ZjIEx3Rj6IEWf3nUw240nmsxiq8LB3wofKgwZKdwtHAEAlezihorb@lists.infradead.org
X-Gm-Message-State: AOJu0YyCBFIahpUK7r6I02PmdPZ5JCv8kLcu8YdQvMi41UYVCdeNgvfS
	JjN69olma9rldsLBa8vM2z4oIlPTQbMB+DT1l5B8Gukoizi4FVKhyBUu4yR3FlAXpjVoL+FuM6Y
	WFYuNRuRyopaeK7M4M7SPlzXM/C7+vv9I1nk0VzEh2w==
X-Gm-Gg: AZuq6aJutAdz9kV+xdKqvT1UlFtYSArwYxNjV8+o4MHAI7Y2sXYUvFQQ4B4srkyHZvL
	xf85zQY5tLEROuKs1loI8HnmDFfMD8T8mO54H/LxwieKQIvC3pAZEDc15eNoQJDhrnuwPoT3qdi
	GFbmjjVxK9e/+HPyxnXyzm0UN0vzWbGYokydShG09H360y4JLXAKY0Bn87IK54cJiVDq04sgQg0
	wlSwGAoW9LZPU37r+bINPlK9LIUVfwgVkcObHvjW9sX4+3uyTBKa7BOPccmcAMP8UTzq8fg3kAn
	QIzuAok=
X-Received: by 2002:a05:690e:1241:b0:640:e352:4e37 with SMTP id
 956f58d0204a3-6495be6c085mr3379487d50.20.1769199654937; Fri, 23 Jan 2026
 12:20:54 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jan 2026 12:20:54 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jan 2026 12:20:54 -0800
Mime-Version: 1.0
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
 <20260123-i2c-xiic-v3-2-eb7cd4254dfb@nexthop.ai> <efe4e155-e307-481f-8332-783cca8a098a@lunn.ch>
In-Reply-To: <efe4e155-e307-481f-8332-783cca8a098a@lunn.ch>
Date: Fri, 23 Jan 2026 12:20:54 -0800
X-Gm-Features: AZwV_Qhbvq6z6hp2KqC8x4j06_32gAkr1p6swgMTlxYCorOJpvUjhPgbmP-suPU
Message-ID: <CAGYn4vz3YuJ251JZFk7M=wsJr=bMY0Wq7x4Er=mjS_spyT5jLA@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] i2c: xiic: switch to managed version of mutex_init
To: Andrew Lunn <andrew@lunn.ch>, abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_122056_314407_95DB43FB 
X-CRM114-Status: UNSURE (   9.05  )
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

On Fri Jan 23, 2026 at 7:22 PM UTC, Andrew Lunn wrote:
> On Fri, Jan 23, 2026 at 08:02:45AM +0000, Abdurrahman Hussain via B4 Relay wrote:
>> From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>
>> Simplify the error path by switching to a managed version of mutex_init.
>
> How does this simplify the error path? You don't remove anything from
> the error path.
>
>     Andrew


Thank you for the feedback. In v4, as suggested by Andy, I introduced managed
versions of the pm_runtime_ functions which do simplify the error handling.
I apologize for submitting v4 prematurely before allowing sufficient time for
review of v3.

