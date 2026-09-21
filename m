Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E412CC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 19:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkVaGp7Cn0+pPyLCGLyICIBFgNNpQjfNjoyqplnwg8g=; b=AX204UrG6bUpxy8Du0j0SoKsD3
	bced2pz/zpb+NrnGO0T1924GxDSsQhYPZhH1cMNSv9hI3Xyeq/OMzTlDibNJS+zdeRpPlNNPcVvyZ
	NDdvTUoFOYq7SruaKY4hOwyMVADOEm9ZqicTryCNTJkyySpvuW8J6AwJTshDhtxAxq+v6LZqspsAr
	dtDRFH7Qo52yulabvRqMj3++YDC19vWE+doSnkWVZdp8LYa+Gkf380LFx8JnOxEx0rvCRfhllNfry
	Yp6pvrwGoaLAWnEo2+B8i8mcKuwpEPd0cxRRrFUlyu7Gzuc7O++n9S5+84KyoLQZtTRsSQ/YCiU+Q
	K1nP4B1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jkJ-00000003Ekl-121K;
	Mon, 21 Sep 2026 19:32:11 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8jkG-00000003Ek0-2btf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 19:32:09 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d8fb334ddcso28083905ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 12:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790019128; x=1790623928; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YkVaGp7Cn0+pPyLCGLyICIBFgNNpQjfNjoyqplnwg8g=;
        b=g1wc6gHPd1ObszXXwlQBvbh9jUrtBPDasWzWTgqhDgT35CfP6fCtc+QHQUPsMOIfyk
         vBJq30+Un/p2iiruCQWeB8bSa9SLCrzSgvVGlO9Gb+xAQ5OZo0VM/DSfVoTTebUwGH5R
         58VKGamx6CQkueRP2R012RfXMCZpY3EouSNhTMjCTo05CBeuxEuLcKFrWIE2/rFVqEfW
         KgoRrcdq/6qDUmc0DkUv2+ivTewu9mQZHb7bzxZCW4IRsHiIVzlUYG7pWlVidmVb/e0g
         W6jupeOPfnJM24HzE2iyE6LBhkEr7zW6s4KoQH9PxElh8sEzhm97Y+pGj4pR89wv18Kl
         yj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790019128; x=1790623928;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YkVaGp7Cn0+pPyLCGLyICIBFgNNpQjfNjoyqplnwg8g=;
        b=g0Nk0+Nqf80mCZFDHbq5wxKuWa5NvldfWD1mhp+r0HZ4aweLFyaIKgjcYYhzbm5b98
         ifxwPGiOViB8AUCm2ij5OXnU8+eN6MQ0ycpkZiNwOhIO7FdNgKnXD3jTQzs8LB6xRsYN
         CKdb+8dhqVmbBOhXZT/rDDnn5Mxn7wwOF9rUQX0SuGJ42P+1jVJ57Yz8WMh8LXNyo5kA
         l/Zhsi20gWCySohmEA7CRYL1Nc0GVLnpacx7hK8+7P2JJpsL8Ia4JsbO5LJys4pjoaXn
         j2hk2VXzyCY5YOvOhW40WKspoby+BeqeVesIF+rMmFMQraOaiskkhwLdgdB0168V7mcr
         XE6A==
X-Forwarded-Encrypted: i=1; AKwUvBy2XgIBbHrYg9WPcGjwTaUo29RfYl4/1NJTkEuIaC0IXoz1KN1bT598/d3lKkIzJHW+uazlY5CrDbFx//4M/irv@lists.infradead.org
X-Gm-Message-State: AFuF++mik/2ULXE/Og7DjatCjNzj9z+06jlBRpLwJF/zO0LzngugL0yJ
	XhLGSNE65ApE2ozB2hL6yz3igEoUflF/QOoxrZ2yKQK/ech/UMakSSBB
X-Gm-Gg: AYBFou1pXJo41+kO+dGv59cf2+Q/KmU1rNSTriegg0outS2xJ0vZLm8bAaEMQMkXUbi
	ZfFsMWcCfvHmKATPU2fOiszvw7oPwhddMx8V+fT6sTT1ZzXxobKoqUSab1KVha3Z5xDkmMcWrj5
	Y0V+HMD4OsQ/rEwTp0ZZdUqguYPbOeDJVjjJgTkkDgl2VsBgXMNo28erJq5QPa96hOfIepHXzL2
	UANInFis9sqy+eDn1/16IvLM52sZ4VOlS7WGRB3GS5r+jiFE3vVcmGyGMeOpZvRje0LGm6B8Un2
	wQ+LT5PPMj0Jong0WXACzXo0gECZjjSNIuKhUyf8rNWNo0tz0cz6afu1E1tkuDhvnQKoNz9Vsbm
	2lI91VY4cOeI9ySrRPPwKIYDYyIAAfP9KGsxQaNePnnTpNpI8dEabBX8b4mVRZQze+odSeVAhoZ
	tRZys7z2o5zoMyz5Y5dJ9MWv6HQveLtiJM5cpYQSl0sMII7q++T6nqqWxGxKLRHLSz4tbq++H2k
	jRen6/TN/DvjMcHyCJMsQgxUt0k3WqBdmn5/wPL
X-Received: by 2002:a17:903:4b28:b0:2dd:c100:a5da with SMTP id d9443c01a7336-2ddc100a676mr100940305ad.46.1790019127634;
        Mon, 21 Sep 2026 12:32:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:e1a7:4f7b:11d4:34fa])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ec60d1fsm126954eec.28.2026.09.21.12.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 12:32:07 -0700 (PDT)
Date: Mon, 21 Sep 2026 12:32:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Artur Rojek <contact@artur-rojek.eu>, 
	Frank Li <Frank.Li@nxp.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: Use consistent indentation in the
 example
Message-ID: <arGGLo9vmxyJQlTo@google.com>
References: <20260913123310.100170-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913123310.100170-2-krzysztof.kozlowski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_123208_673239_C787A05E 
X-CRM114-Status: GOOD (  10.54  )
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

On Sun, Sep 13, 2026 at 02:33:11PM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied, thank you.

-- 
Dmitry

