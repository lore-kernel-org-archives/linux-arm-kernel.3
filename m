Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2BEC98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQGSUWP+wqeItZ/eyVbalLMbvY0OTH5QJikLeqmKP+Y=; b=p4MUldk6B2GLkQ7TKXAjhEap+h
	nGPz1Hc3h/T658I5xrCHGaTVNBHK+qsgjb7i+EK0Ki1IHdHtdmHdjxa45VWGEwHyrTioT5UNk+Igf
	MZE1xTqUfRI29cD+4whqulWyE4xnZuiE5nPHQ4lm2Lnd0Avtylts8k16GHcegEfH7VIKzruYTy12t
	E4MHYQdmYGUVlf9NZ/UFx1JTu9fP+JyAcPARtJuwXSevH0Zb5n6mIbGsSe8XyM3Nmsv/xuVoL4+On
	A37vzUEM/9G+cEY1nErh32Xvplk0DHERaObLP1tD/CCurqeNSf32+UyWGAUl2+jXKqS1Sv+tSu+nz
	zBuhkfhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e0N-0000000AIwL-4B3t;
	Thu, 24 Sep 2026 07:36:31 +0000
Received: from mail-wr2-x29.google.com ([2a00:1450:4864:30::29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9e0K-0000000AIvO-4Apb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 07:36:30 +0000
Received: by mail-wr2-x29.google.com with SMTP id ffacd0b85a97d-482e1b30c94so222307f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 00:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790235387; x=1790840187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQGSUWP+wqeItZ/eyVbalLMbvY0OTH5QJikLeqmKP+Y=;
        b=s5yp9WHMbFp/bIFmeTKzqfgUyXN7+/yplotK42P+uTG/jXoBDf5FuRlx1zhAyeQjPC
         d8K8vleLML6SnAujQaYRLAWMjQdzqEI2qNy4ePMVR2Ffbk0Fr+jkPfAqKGwBxTwm8fJL
         FigGpkC3Qt0upLNjqcbo+8H7JqGo7L8SQIkgwek83ZF73CBTlaswGDXhKBJ4ALFG3tVl
         LQK4cp9HvScISgH6g80UXrKO0FtZQFOPGTLAtV954XjpV79/dKyaxvaIsd6oPfWQXmZh
         Fnb1U6WMvFwKGpYQK7TiOdvHMf1kOf/23H3QjHQ5LSymbX+fkyIr3RjNvV3WdPwWMaU4
         SNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235387; x=1790840187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pQGSUWP+wqeItZ/eyVbalLMbvY0OTH5QJikLeqmKP+Y=;
        b=iL4oXpPFjJhLi7lAcXxJGk2ony50TfDTkLjgzXTpxALKmFmBEFpWiezTPRuz+rM2bF
         tFYwkkO33WxL5mC2qMbkBQk+/ms4xLvzbVB3573AQNKFO9flBPm6pQ3MxAmh1lGo0Qx/
         kpHabFbiLbxNvkNY801WaZ96iNMIOBiQx+QF+MdVwJXbfxJ6d2QGx3iPmlWKt8Gk40pQ
         NqxKEsnCgmnl95YyW5FKk0z92L7PAJA/5dmNC1Y/LcCYtJDaYwWh0jRAZQcJPS9Nh7fg
         /K3VCwVDwsAGmA/xtsXk31c7j0p7dfE12LAC0gALaQZTLrRDsy2w1PRNeuIQpU0s0YPC
         dYLQ==
X-Forwarded-Encrypted: i=1; AKwUvBycL8n04ydfF5JeFj3Jwn8paL8gPASzOmjWkMqliFBcBpwlCLZsg7lg3hJqQKq0AxvdgZj934XGOwFE28zPW1dt@lists.infradead.org
X-Gm-Message-State: AFuF++l3V4nI0Tzc1YjuaDWrjkYlR5orWL5t6WLYL04Ws5B+8VJks4mf
	2DrFbDsTj5IMht3YPvkhw3/lAIK1zLbxZqjvBUF5izNbIdF0t9S/gHYT
X-Gm-Gg: AYBFou0BudRHUmzj8GUKLkX4lnAOro7ZT+W9Lc/KbG/gh4TZdWPxUHLyctS2HTWP4dT
	is+Mo6vYjRFv5mg0ZNLPurC/84je29UqmYbqWBzO2+sZToM8Z5b6SViMLs2akOFj7+A+umygV9P
	ZP0efKXhzLMdt7HAxiraf5HvlkOfSfX6WP0QpjpDo+dRQRqFLyJzrgtd1HgSj8Bn5oYswQZr9EU
	V1gQnfAy5WooAyIZrnU1/1p+RhKaw7mScrGVsZc+FsXRp2vj96dn6wBGhBWDQWYp3V/IsSuImrc
	TshsTVNUI+5m/9Xwl+nkUI+7ggR9GJmL9xo5ekbc8prlD9jK0KyFI32BT+fNXl2mz4uVqcAaTRS
	vHJj9fwGqktiF4yLdv3q+qbmCEwrsYoVKyafBFkhZqIlx/9ouC9bogrOlfYfQfvg9zL0g9A98hg
	R7jcNtZsG6ZecnlLBxX8RNchvXpWyiR2PIVcmLihEpSC+EcvNj6PX+r5NK+m2nWN/16UApASySU
	bSqyGf44GrOPB+os7e9ODxjNwvExKrrk3bKbvHWlbQTDtDJ+YdCzC71yZvfKwyF2zg97Uv87866
	xyo=
X-Received: by 2002:a05:6000:25ee:b0:487:342:d145 with SMTP id ffacd0b85a97d-488716c8044mr2252224f8f.2.1790235386830;
        Thu, 24 Sep 2026 00:36:26 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B90C500C183EA9C12FF3B42.dsl.pool.telekom.hu. [2001:4c4e:1b90:c500:c183:ea9c:12ff:3b42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886877970fsm12839361f8f.24.2026.09.24.00.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:36:26 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Sidong Yang <sidong.yang@furiosa.ai>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jiaxing Hu <gahing@gahingwoo.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	=?UTF-8?q?H=C3=BCseyin=20BIYIK?= <boogiepop@gmx.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/11] accel/rocket: DVFS for the RK3588 NPU
Date: Thu, 24 Sep 2026 09:36:06 +0200
Message-ID: <20260924073606.45849-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAPsqS2SC1GvzALUdf2xsHZDpNjDO7BXrmzk19OYTF6YopQc8iw@mail.gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com> <9cc5365470490b4b66364e60fb614ccda7e86c6f.camel@ndufresne.ca> <CAPsqS2SC1GvzALUdf2xsHZDpNjDO7BXrmzk19OYTF6YopQc8iw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_003629_052371_97B8B4CE 
X-CRM114-Status: GOOD (  12.26  )
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

On Thu, Sep 24, 2026 at 07:37:04AM +0200, Tomeu Vizoso wrote:
> I will go a bit further and recommend you to not let the LLM write any
> text at all that is to be consumed by humans. If you don't feel
> confident in your English, you can ask it to correct and improve your
> text. Or write it in your mother language and ask it to translate.

Thank you, Tomeu and Nicolas.

Yes, it is true that reading and writing in English is hard for me
(speaking is a little better than reading and writing). I understood
your message, and thank you for the advice. I have already applied
it to this reply: I wrote it in my mother language, and an LLM
translated it into English and corrected it.

In future replies I will always say when an LLM or Google has
translated my text and corrected my grammar and spelling mistakes.

Thank you, and kind regards,
Igor Paunovic

