Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05C8C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 16:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40bhvWuLcQuZkugmJitkPWKbQ2rZP6fOMYhTW7vzOYE=; b=ppRBVUudRg1COKvgvrRFQhDUom
	X3fvvnmuHNHKNsXKJmB3s84+G59y80EzsUwMpn95IrqsbxhtI4aNDMtd81Oik4ElQxYl5N4cOLx7k
	U8GcHmRNTU8e+Hik7ly7kWDXXnpInZu6OXoxvXmRqynnFOgyIctcXGNOHtIYVSYHhjHqSaSFY+kN4
	aReNCWEiiWeenmwsnlXzrkx4vh4ChSYqlewOHdPfB3Flq9IgeT/NflFhDVy/vKNzBF3C+Jat00QvW
	sqVz+892ZzQyT719l9exix/6+wXYJdj0Bm9rWF0ULIEj1odB11n2ixtqZaH6gq1AGQ4M0Vl1BYS5S
	0EVaveTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDTV-00000009xik-0Omz;
	Tue, 21 Jul 2026 16:37:45 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmDTS-00000009xhz-3KQs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 16:37:43 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49550ec592cso16622725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 09:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784651861; x=1785256661; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=40bhvWuLcQuZkugmJitkPWKbQ2rZP6fOMYhTW7vzOYE=;
        b=AyxTH54U9vFHjEEeZI8B5b6h4h0Ztnl4I+m+zDxidwGNyCStjp0w20rT5RLbLJ+/am
         Y0A4aGVKD1aegHf2CGOHHXhsm0YX6YiAVlR6vfeSRoQQHmdOOq9lAV+wBPops0czttvc
         duGVgOX70cs1Q2hdEMFnbj3viQCv66pYlu2pONi1I0QmlN96ydXRG4Xci4FU1lmYP2TJ
         U/mChZwpZwFcIp3WX8uspQiegEaY6/7nUNtvLwpv1CJ0J4DtizRp1YG6LOHVvjRw7DqS
         BkWIZeNpqAdLrzt8eYcI0iT3UZ6Yjn7wkE8iwH4iq8S05z3HVLNIcCUsR8MCUAM4S6J0
         NMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651861; x=1785256661;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40bhvWuLcQuZkugmJitkPWKbQ2rZP6fOMYhTW7vzOYE=;
        b=qsfXY+VQBlenaC5jxvbmvt7KqGBkT+WZbSa9kn8rO8Wbgt13pTDM8uvhgnLzJARn/R
         8Ki5GkpXft+QxWnbRmxmLrc99lPcd4qADRMMvLPOeqSmXmEMeuyZMkz21xQ1EeEHQQau
         1FhqaBCXrHjbJMXybq+7s08E56KnX8AdcvMjVMNjqanoMwiJK+YSlWnUuvovOWtNMcZD
         YSMb100lUAhgj3UL2eYOzlmXEsJaQzRCWwFYsL1khT+iWu6c4RKro5vwDaE+Zlxyuo8z
         bDUF2+Si2IAObiXiN7AYaeYzIDtIZn0j3zjcVdNDYPfbJD6y6Bk6oemjS76+gi/8HuPT
         Z1Ww==
X-Forwarded-Encrypted: i=1; AHgh+Rr6vMmYPGLTB2SKnnZr0z+FedSo830Yg/xOQwp9ed3PLnR/Uws+u/0afOrMDXWHoUwO5cmYa+83AP7SP5BOs+VW@lists.infradead.org
X-Gm-Message-State: AOJu0YwVWZJmjgwQ1XPQON5QQiU3BBHsWDDiuLPiL8j6RZHcGDP0aVZ4
	JRPCK7Ob3B0YYlEogT+F27q4/h5qD1QO6IL6qvUGQAC7Y72UOkNFmDvoLfR+jQI+/ro=
X-Gm-Gg: AfdE7cluDtOmMT2xoB4MkmwTWm4zYLW9PM98OBN24ESKSESxYBSSYwf7X3VRke5VJLl
	67cMaDOcR/3AhL+MiVPvlYVCwS6itTGvoHVkwZbr91hYyxutw0Z8C0rLHLGbpmG/0g3eiejMu2J
	iAHezF6WJCWNQIeRqNcfbJjDNQGq8lpaazS8PNTUKzsRbEvxG5fvkBXPU13HosK/+vg1bEbwzYv
	N1V3d0COhG6TP+uQhiYjqtcpAONSA9FvLTlp8FZWhLlYlNrP2g9xwZg3DlTrj7pmmptrVS7Oy/3
	wke7SgyYDLVbq7lFx4S6VKh7bcXXXdItGTZq6pNSzHmB60KKRc+STzDHxtSe2bEskiqzfTRJTlZ
	ozwQnnpQnhZGhMQdWI11ARz21OB2cdUXysJyfY8NHTmXPMHAILiQP5f8AMlEThjPKEu2wEncCTc
	W9ahYwnizRPJ8xhzTjbBAYZVKMc/mYGnvCmdijeU++xg==
X-Received: by 2002:a05:600c:4f52:b0:495:3c6f:7c18 with SMTP id 5b1f17b1804b1-4956a4e5a97mr4023405e9.3.1784651860712;
        Tue, 21 Jul 2026 09:37:40 -0700 (PDT)
Received: from [192.168.5.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4956a4aae16sm5630075e9.0.2026.07.21.09.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:37:40 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/3] clk: nuvoton: ma35d1: fix ignored div_u64
 return values in PLL freq calculation
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com, 
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20260721021356.288506-2-a0987203069@gmail.com>
References: <20260721021356.288506-1-a0987203069@gmail.com>
 <20260721021356.288506-2-a0987203069@gmail.com>
Date: Tue, 21 Jul 2026 18:37:33 +0200
Message-Id: <178465185379.2337945.12880705771823574527.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=512; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=VjhcrRyFSt0TCIckPnHWQoGZD1/E2QgBBydfNjacV3g=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqX6BRL8ADPhNE7seqx/Nl8A9UxAuhtpaz1L2br
 txXpv/EUGOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCal+gUQAKCRArRkmdfjHU
 RTx3EAC42MZzcbWJpEFwTSKiCFHwt4gjkRkZgRUQxWAsDk2tWsQ97GVcI8KqxA+ylS1j9XSzqW+
 05CFk8TgChSQv6wtzI16rw6KN4wmcry1MriTqZQfJHOiu+qXKksY+PUSJ9O+fypgf6Gkqpv4WKa
 mliPSO42H9qUMojFukGZhtF9i19UTAy47MbU+LUemgur7aD39DfTHLHFwj2Zd70G9Z9q/jAf684
 nY1l83yP/iIO6Vj56eUu37kEMZu77xZhFmZiHquG15aU8a7IgbKIaUPZl5iT81LFE2ofiesiyeb
 Zyb9u5zjOkJE35qg6D5k700ntoBF09W9YqkN4O12hbnL6y0S9cxpAjgiFpUd08eAKVspHpz8pfs
 6kB3zDqD58BCUBRyOxYdksjT57ougOxiJ2oK5sMt3jQOkoUJmc41Py2T6JSaUizvoCwX0O8nMZu
 CiIx8WPTJxy+mgACTJbHWsYkaq9uU4aK2HDsUKLmOo3zPpLFiQN7Q968uYu27tLWfUJwyWsrTS7
 d15p0mhBv2/dC7qbW2wPz/sXydM5ob4XYK0zv6p0vLJrPy+DZIH87IkTT8gJS5qLPb977A8JGC0
 lqiPQCc4RH6XssmdZVjSdMKhs8fsSCufgNufyJ9jpmeRKu3G8pasKqVXiC3LzcRb1ijP08uwTqA
 kRS/W2MzC3k7f/Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_093742_853852_123170CA 
X-CRM114-Status: UNSURE (   8.17  )
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

On Tue, 21 Jul 2026 10:13:54 +0800, Joey Lu <a0987203069@gmail.com> wrote:
> div_u64() does not modify its argument in place; the return value must
> be assigned.  Both ma35d1_calc_smic_pll_freq() and ma35d1_calc_pll_freq()
> called div_u64() and discarded the result, leaving pll_freq holding the
> undivided product and thus returning a frequency orders of magnitude too
> high.
> 
> 
> [...]

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

