Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3926F55429
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 23:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaFTBYE7pFhQ5Wo9wLOr+Dlo/OUF/sPft+MdYSKIvhA=; b=IQKYwpXTDbE3qK/Dk/PEs0zNse
	VqSXjaykE3Kf8yyLmNtcr/fl5tM9Qx89v3+LBLytPil+OBF7iQP4d9rhWv9ArDSrJLzzIGqZt+rC5
	YSbjyRlGFomzwrH8c0u+KS6atkKX36PphCjCBjDYqpmIRS5hVqjws7bmzqP3E50ItwQpJ7MUiPghF
	hy96ICbD0VPuPOvmoiDd92Z2DsqTsl7puPniVGGmxLy/c3J+gxj3Y6hkSwf2FipdmSNbg1kEZiiAo
	LmlI3MOD2sif+DfdxwVxrlqfNLYXy+57ppq0HnfppFQJ7XlCuHWYRf6RJCo864+tMS6VTUq1GQ4zD
	W3o6RlPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1Yw-00000002uv0-47If;
	Tue, 24 Feb 2026 23:11:31 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv1Yt-00000002uuU-2JTh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 23:11:29 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-824b05d2786so4640276b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 15:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771974686; x=1772579486; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aaFTBYE7pFhQ5Wo9wLOr+Dlo/OUF/sPft+MdYSKIvhA=;
        b=TYTx9R7Tp4xb9I32mAQUUGxlTYDLc8Smglm3lrjwwL7no40uQbFh1itriHBtfo8UWN
         9rbZibNhchLMIrTr+cmmoigL1hmZG+51CZuegSI4ShBIcBv4hI2JVLx2uGDBZgl8PVIk
         8J5grmLwQrbnWdekd5kpZlrUY0PY4hSbCJRI0+X7RdVbOx/oRLnJPuxbbfPQn8QxkLGr
         ijQ8yY8f0yGJcWi1jHjWQZ5kohq3dHc4KpQMQI2y5eU4Dd3SugmiliPfEMHUlY8bbnuH
         YKiUJS8mTMAhiZdyLh3V3I4kmOAUuEVHtuGlw00KU+OFISoSHfno8zsq/XP83ZKFohe7
         zc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771974686; x=1772579486;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaFTBYE7pFhQ5Wo9wLOr+Dlo/OUF/sPft+MdYSKIvhA=;
        b=so3pQfuqLu8PPpnmmgYeTwJXbZpCAxoN7Cu/RrLqg+TM4oATp2HDhyZqjyJYu6ze/1
         gfZ+xi4WPtc1D1UJCUWIuMWHcn0RJADK/R1XEJaUEyZ0bh3j5LFd/0TOtDH7DFWu/GAX
         /c3ezf/0SzlcKQDN8GJGAWlFlYNb2I+AXJePOJbrbZHW4ZuVQviMhhF3NMnTOtDq8baV
         hayPW+lMcRE66SugQIoBrDcXh+73GG2EjtcW1+aPYnjlHJFakqKTOeboqBni+OEycfdG
         WlZBC4Sr9riAAxkn4+3d2dql7GAJdKM5yS5yxH45LovPRqMxxJSNdJc34sp+foIAtwVi
         XD1w==
X-Forwarded-Encrypted: i=1; AJvYcCWVqSQhNMJs7oR9Weh75nD9b+0M9H7dixXQaTqBa2OkOgwQ/bg3+TQPJ+5ii4X8whihDTLQApczzXOJnooETNYK@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8MTX6VspRlrM7wL8Kag6xQ6HLT5XlNSxteGnByEly4JpNylzl
	Xm3PehFf2GY3ViUClBhRzApMwJ78+nudv1cQA/Qk9enQLQ3dFjEIyHYF676BIvAzdoA=
X-Gm-Gg: ATEYQzxrV5LXbcQLRtZW1JNvOSTluIsQHUqzdHYVmb4RE3TqRvnwHmY1Hh9nDrFcq7b
	JMc+UIlk/VP9cMJa+Oq3z3PRFuIPszZ26GnwLu+toKAHIO0InwU9gkkkskjvsGAjdyTaSXIbQet
	dShlC9KnWocokt9z9Auge+1E4Wf1xPSDKnJusCo9db0zo97p5dO/cVVJv+UjtwgHkoLJcE1zKv7
	6o7kNHR64wXDp5oosWdyTGHiRXJtV7BvknxYjxk+c3l/+ngVySsFFUp3Cu0fPQTuU67he6JOvdu
	hdN2gA6cxv7CRwPtPMT7TsznWcjtEudeVD0kWuFx8wOTsZtyGqSuGa+A6E4mnejlqd2/pfNVYEh
	B+BSJSKgHbKeqhoiOcXt7N2uXIxL3/Ka5VudoJFk3cVmYyxBpnArv8pDPM/MidJv64pt9uSBn6g
	ybbWHC2hmCxxp2Y1FYhVCt
X-Received: by 2002:a05:6a00:1746:b0:81f:b1d4:b486 with SMTP id d2e1a72fcca58-826da8bf4a2mr12692323b3a.8.1771974686262;
        Tue, 24 Feb 2026 15:11:26 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd63f1b3sm11486793b3a.3.2026.02.24.15.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 15:11:25 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Sudeep Holla
 <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v5 1/2] pmdomain: core: support domain hierarchy via
 power-domain-map
In-Reply-To: <CAMuHMdURxN=kBQHJKnsTVEQPeuB41r5kZy4sgFNqg=U2ynuZMw@mail.gmail.com>
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
 <20260122-pmdomain-hierarchy-onecell-v5-1-76855ec856bd@baylibre.com>
 <20260127151735.GA1699112-robh@kernel.org> <7hjywtzaiy.fsf@baylibre.com>
 <CAMuHMdURxN=kBQHJKnsTVEQPeuB41r5kZy4sgFNqg=U2ynuZMw@mail.gmail.com>
Date: Tue, 24 Feb 2026 15:11:25 -0800
Message-ID: <7hv7flrb36.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_151127_852520_8FE2CBAF 
X-CRM114-Status: GOOD (  32.61  )
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

Geert Uytterhoeven <geert@linux-m68k.org> writes:

> Hi Kevin,
>
> Thanks for your series! I became aware of it only recently, and read
> it and its history with great interest...
>
> On Wed, 4 Feb 2026 at 00:13, Kevin Hilman <khilman@baylibre.com> wrote:
>> Rob Herring <robh@kernel.org> writes:
>> > On Thu, Jan 22, 2026 at 05:14:00PM -0800, Kevin Hilman (TI) wrote:
>> >> Add of_genpd_[add|remove]_subdomain_map() helper functions to support
>> >> hierarchical PM domains defined by using power-domains-map
>> >
>> > power-domain-map. No 's'.
>> >
>> >> property (c.f. nexus node maps in DT spec, section 2.5.1).
>> >>
>> >> This enables PM domain providers with #power-domain-cells > 0 to
>> >> establish subdomain relationships via the power-domain-map property,
>> >> which was not previously possible.
>> >>
>> >> These new helper functions:
>> >> - uses an OF helper to iterate to over entries in power-domain-map
>> >> - For each mapped entry: extracts child specifier, resolves parent phandle,
>> >>   extracts parent specifier args, and establishes subdomain relationship
>> >> - Calls genpd_[add|remove]_subdomain() with proper gpd_list_lock mutex protection
>> >>
>> >> Example from k3-am62l.dtsi:
>> >>
>> >>   scmi_pds: protocol@11 {
>> >>       #power-domain-cells = <1>;
>> >>       power-domain-map = <15 &MAIN_PD>,  /* TIMER0 */
>> >>                          <19 &WKUP_PD>;  /* WKUP_TIMER0 */
>> >>   };
>> >>
>> >>   MAIN_PD: power-controller-main {
>> >>       #power-domain-cells = <0>;
>> >>   };
>> >>
>> >>   WKUP_PD: power-controller-main {
>> >>       #power-domain-cells = <0>;
>> >>   };
>> >>
>> >> This allows SCMI power domain 15 to become a subdomain of MAIN_PD, and
>> >> domain 19 to become a subdomain of WKUP_PD.
>> >
>> > One concern I have here is generally *-map is transparent meaning when
>> > you lookup <&scmi_pds 15>, &MAIN_PD is returned as the provider. It's
>> > also possible to have a map point to another map until you get to the
>> > final provider. The only way we have to support both behaviors is the
>> > consumer has to specify (i.e. with of_parse_phandle_with_args_map() vs.
>> > of_parse_phandle_with_args()), but the consumer shouldn't really know
>> > this detail.
>
> This is also the first thing I was worried about, when I noticed you are
> not doing transparent mapping, but add an explicit hierarchy instead,
> based on the map.

Yeah, the map wasn't my original idea, and TBH, I had never really even
heard of nexus node maps before it was suggested by Rob[1] that I could
use it to describe hierarchy.

But... I'm gathering from Rob's and your recent feedback that my current
approach to using a map is an abuse/misuse of the map because it's just
being used to describe hierarchy, and because it's not transparent.

I'm still waiting to hear from Rob to see if I understood that right,
but your feedback is making me think that's the case.

If so, I'm honestly not sure where to go next.

>> > Maybe a transparent map of power-domains would never make sense. IDK. If
>> > so, then there's not really any issue since the pmdomain core handles
>> > everyone the same way.
>
> AFAIUI, SCMI is not limited to the SoC, but may be used for the whole
> hardware platform, so it could control power to external devices, too.
> Once we need to map a power domain through a connector, we need
> support for transparent mapping through a nexus node.
>
>> I don't really know enough about potential usage of maps to know if
>> there's ever a usecase for transparent maps.  However, the problem I'm
>> trying to solve is less about transparent maps, and more about
>> describing hierarchy in a situation where "leaf" domains of the same
>> type (e.g. SCMI) can have different parent domains.
>
> Hierarchy is indeed something that cannot be described with the current
> SCMI power domain management protocol.  This includes external hierarchy
> (your use case), and internal hierarchy: AFAIK, Linux cannot be made
> aware of the hierarchical relationship among the different power
> domains controlled through SCMI either.

Yes, the limitations of SCMI (both the protocol, and the Linux
implementation) are the root cause here.  In case you didn't see it,
before I posted the original version of this series, I started a thread
on the arm-scmi list to discuss implementation options[2]

So since this is primarily and SCMI limitation, maybe I should just go
back to the original proposal of using power-domains-child-ids[3]?

I'm definitely open to suggestions here as I'm a bit out of my depth
here.

Kevin

[1] https://lore.kernel.org/r/20250528203532.GA704342-robh@kernel.org
[2] https://lore.kernel.org/arm-scmi/7hecy3h7ky.fsf@baylibre.com/
[3] https://lore.kernel.org/all/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com/

