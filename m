Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FA1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 02:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ei7lzooVNqPcmPvnGQUWAzZynen8CdGkVpkx9IfRm2g=; b=4oec5x2MaHARwwXbZwlq9/rfFo
	4PcMONWFK0flSC6ME5EuVD16PLajxLQFBqmFNX3diAgMWq+8fjQ5prdVQh7I3zWIUR8ORAMHfYbKI
	xFlTQ39F1ztzSQ6rbnanga+kPkNNI4taqXXTXDppEMOCNcPdxmZE8z3wNzRGFf5ItRpRns6WWI2dK
	PrENW6DasOLgNLoIDKsTzhC7gl62vVgIE5KtbdbIKvhRpDn78YHzAUGCUZtJxwk5IxIHUCEXNWZFi
	XKwgqCX9wDsZsSaF3LevxIle6paVx3kMX8WRp1bDL2Kj79BwvSlwmuT9dMgd0iZtskU9tDinWKN3e
	A52Rqimg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6NK-00000007y4Q-09tZ;
	Mon, 13 Jul 2026 02:26:30 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj6NH-00000007y3i-1eaq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 02:26:28 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cac59f8b64so28834685ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 19:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783909586; cv=none;
        d=google.com; s=arc-20260327;
        b=kL+dFVI0zE8s6frr0odIq0A2hA9s53l3jkzGuaOLDCcJF0U5NrwpffMZA2wAbriiwZ
         cgKIq2YGnaE2HdIlWBxYQygGzJ88hLXBljxaG015tAHteo56AYQWKJtiqCErUCm9m5B0
         y2ZBtBk/GYzF5+ILLbdrG85Tepy+ieFILf/Zp/XaNmoPMjMVk2Awga3O3+a8uWwml5UN
         04Q/jIqlUY/CvjSyQAR1X1AfZn/WXa6k/AUiY5HfQ0a+bVIChukDIb5A+Qz5Rnbt5bmj
         /HyuvBKhWJOoArBJGWo5B1wxHKOXHQP0Q9LWMI7ry23wlRM70mL1nZgoq/9frd2Vr0f9
         r5HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ei7lzooVNqPcmPvnGQUWAzZynen8CdGkVpkx9IfRm2g=;
        fh=ZM/ZjOXyNtNvve+ODilgeRYbWmzv/mHzK2BZtcU2f9g=;
        b=BpQGONdG0B5JCqmJ7yM3i+g7zQXbU68r53LWbmvWRgnLysqcEADqRmaL31H6OkOXCx
         7PLHF73zj2t3pLTh379uCmx+47IaFywhKf4YfnJs4Y8TWisraDi+GOtKFmW55rg1pq6W
         wI3bKRA4aMWqBJQN4SNYMWhN6LVaOiQ8cMmswsaG1PdM5aED2t2PkYZbtC3dix1nlI70
         9iEyUne9kWoO3kD8ZjOwwl4bSw8gwCWjndeZiF+3kNCsTJCA7cdCPusqKvhQ9JyzLWFj
         aRiIZLDZaCpCikUThe0kTkxKhEOoUQc6HIZVLx4p++65oTC79ql5xBB1dx5QCaUg9u+S
         RCUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783909586; x=1784514386; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ei7lzooVNqPcmPvnGQUWAzZynen8CdGkVpkx9IfRm2g=;
        b=ngHu0EkAy2JUj5cX6ZuG6tX5v2Ol1q/uZ4ZgdfTB95A/UfGLBBOpAK7BOG04eCNq1W
         k7T9zPGzt2Pv5qoQOsPj3CNfyFJ4CDuP4lFFt0s5PSPg+zUmBcWDvN0N9OiGRaISOxCG
         K4ne6+cP7G5cIhtI8iVeq97/bxaI5Ykc4dGkup9bGBcuL9jvwC38TD5r1KKSuhw4QoR+
         1w3htImx0mDnPOp7Axc3k05l25x0QKpbKkKkPcsIXcXyRMDoqWG3SofuVpKm+ZYl4TW8
         mK31sBpNpIEA+dj7fce3hivFM5DDszvtVYkaTLElayTeO7ke0Hr3+mWd8Gy1SMOPfTDS
         JoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783909586; x=1784514386;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ei7lzooVNqPcmPvnGQUWAzZynen8CdGkVpkx9IfRm2g=;
        b=RIaeHiJdEAylLPEpePFjJkVz38CIEPFqP3DU3igIIUEJwCSoSiY8f2wU6ycD8y9KfY
         7CwedCqoBX7ZYQJZRSAdaWY1IWk65zLOMz1GqTa9UFIn4E/t9vXFRm48B/lL1d5nSFTC
         14wsdZXShW3v5Bhx3zPw+talGn55zcEQ1Cv9Gfev9vfmsCbJBRbz7w3dXKplgoz/VqcO
         YzoYWlkiRx8ypTWKho0kcto3Kcn77fE4UMndslgf9N568ZIyu7Vdk+0dWkeIVwtbhhFu
         I0mVNa664vH//1or8ZRy01xsd7e+P9oObmFitGtks5P9JNOOw9lVeTH7E8g4V7hiGRmB
         zXeQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSaEVq7llGZeAXP/Jt1QN5IryiXMHPMNIZXmBlk7XWY7W2AxQS9eRlDBMuSPBkO20ylK82Aj0677quTo+thYI1@lists.infradead.org
X-Gm-Message-State: AOJu0YzDimDYLgTUIGc/eFmu/3FBStngyGCSQE+GkAnswH7A1P2jW5Q3
	iTlJJBQgrrqe19SYQ8k80zrbKWpnkLbTD09dbMQLprle95RFGJoEMqfT7EmmV2AQwp99egrBvFk
	YpI1CtjsJB3tqQjKVCP+M1J4m0uSUf4IhcARdlx4=
X-Gm-Gg: AfdE7cmeDOm3FPcVGn9FCyUlO18dITB5ChkYjvvu3c0RoYyiaMpmuL3iCiiBUTewGrx
	GMWih1Eia4I/+m5avI0LqEbS3K8ouZyKLPV6pHJ5iXZvyYm/+ABi0NtcO0wylx2sY1xcEmSvysx
	e8C3cCNyFdQWJ+nUOHB5YmMpa2ulnEuUmtVONXk/h5Q9nmgzXdXHMTpnSrivZy044560f+q1d6U
	BCzomC9rZ4JFZwjuP1t3MVkY9aWU1tqeLRymyPf3FFJe/QKo9JqVZLLpQMY9RpKq8IRAKHUH7Rb
	j/JeTSfPFrZoItFZGs4hNCvZDwucERbFcUednA==
X-Received: by 2002:a17:902:fc8f:b0:2c9:97a8:afe5 with SMTP id
 d9443c01a7336-2ce9f27e6dbmr67887935ad.40.1783909586414; Sun, 12 Jul 2026
 19:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
 <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com> <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com>
In-Reply-To: <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 13 Jul 2026 09:26:14 +0700
X-Gm-Features: AVVi8CcDb4bcqHg1Mp91TuPyHToFqGPv1UxLDhLLf3L4cwg_2AzYrLa7QzDha2M
Message-ID: <CAABR9nFwGjed9SOUZwuPNu58KPQD-aWnCKj7YTTM8LdF9dig-Q@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_192627_429797_E8CBB50A 
X-CRM114-Status: UNSURE (   9.28  )
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

Another point is: when should regcache_sync() be considered to have failed?

From my understanding, if patch application or cache synchronization fails
before reaching the out: label, then regcache_sync() has already failed and
should return that error.
However, the function currently uses a single ret variable throughout
the entire flow.
To make the failure semantics clearer, I'm planning to submit the
following follow-up patch.
I'd appreciate any feedback.

------------------
int paging_ret = 0;
 /* ... */
  out:
/* ... */

paging_ret = _regmap_write(map, this->selector_reg, i);
if (paging_ret) {
        dev_err(...);
        map->cache_dirty = true;
        break;
}
/* ... */
return ret ? ret : paging_ret;
-------------------

This preserves any error that occurred before out: while also
reporting errors that occur after out:.

Best regards.
Phuc

