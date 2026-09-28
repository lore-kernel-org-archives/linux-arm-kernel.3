Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FD3CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 22:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=; b=0ylvewAKApQnLRmJ7dFwu8LFES
	dLYziqkrpqgMnL6Mtd1TjhXiMGPxAQ+SGtNU2nretiWipO7LI2HSb15oh/U9fX4RtcP+/4lid0Os/
	ogbDhImDjUmKfJnAKIkAhz/WfO+2cxsxrmZKi4Qvg5gfkcv3AT84jMN0CIcbScDrtfLc4R6jm5rSh
	LcoPdYzvyGaeHZGZrSiorf9opq08dg4GbfVpUZ75xTVgPjq/RZ1Vwm7T4aVxOsQLJidz1xVSDtj8O
	iJ6MCDqJe3LhbEw3HDNCLVp6/GidC9gX3qsuMY24QUu64T8fAE573TAxJaiCsJTAmNScZ5ikdqMNN
	6Wtb9x6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJVn-00000001jP5-3Iwm;
	Mon, 28 Sep 2026 22:07:51 +0000
Received: from mail-ua2-x10.google.com ([2a00:1450:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBJVl-00000001jOg-011Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 22:07:50 +0000
Received: by mail-ua2-x10.google.com with SMTP id a1e0cc1a2514c-97e7c796e3aso729758241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 15:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790633266; cv=none;
        d=google.com; s=arc-20260327;
        b=SQF4JKdcjuxehW2ZHDeJi/d0xSVJ+FTyPjdEJlX54CXo2Ol65lwbekKcWEodahnCJj
         IaPkWfzbr+2ooW89dK5uFBMbxXvsQgEgaqV1OAWNHK8kxGkY+CZA/u504aUFwuJpT3Ws
         rM3psmkqEhgxUdNWopueeIhC4/7kOi4O1xd/d76j6PiMVCvpCa/ntN3Txw4O3+/QJZhm
         AZK60lk1e6QiSvtYoedt97ETKn5XdaHMjYKQFuibiha9l2drEOLBItJOaf7ktyOs2EO1
         sIHSGqp1AnC6aIClUIuQY3UeGl9sMuJr+u/W3kTMc8UioP+/Q7JrNWKE5gn2QnmrkYbb
         4ZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
        fh=0NswkaVgjuq5tLd0LKoP7Lkshx31/mLNLclUtESvo0E=;
        b=dmGEdNynRK3JeBD0xxoXuRAzyF8Is4/sl4HYak57OmM06VQ9Q8sdmcVQPW9c5vbGET
         pLD1PYmmM2sLgjSru31Mqp7A867zgVZhAH+j5/htwD27g+zY9iVkR0iNlQXXGGhTfYbn
         pitM/5zt+u5qG+37RfdPtJyKsqUj8JwJCCkh4kMDEvi00niilz25P56Dvv/2Q1e2V7LE
         98hqz5rXoSf5JXlQrUu8Vk3We3wHBJAGw4E41Ve1//kigLr3ktOBLnc7JgnugYl50oJ1
         PUqOYAqrU6aIUvMaPyu8CCAPrELblDUNFyIf17ChVunps7vaX97lSdU7+FSHF2crPuxq
         jSxg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790633266; x=1791238066; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
        b=kc+8hzGi0FQDuG74X36zGB1oURcjDv5ETjyutqhYl3aWG1mgX09jihCfwtbiklbBmA
         xQA224YmKIUTOx9ZbZ3L5mOqFUe+VSXHJYAU8/mvH+BblilffXt1ZUBbroA7Qe30DKa7
         x0Q+iSK3gvJhFfQ+SR6CpzYWqB3ZF732IrHoKlkFHD9xdoQTdzfYNI1eucDzbruywMVn
         aNvjlh3rbTyIhHRMDN4/5y058w/AlcHulaAZ3RSjAyKlu9/Le+ZFg/UrcaAzIHuTfwQD
         wMR3V+dsHKFl9d6EwC4WJfybJTMWJP7OlzGT5gvUzP70gNXEyilh2QlhD0HvK8fHavy/
         Z2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633266; x=1791238066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
        b=j+grjmo1TNSBOI18zqiTtNPPFe4enenbqDxhMZ6acaW0r+aMnrZ/GpV8GVKm5EacyN
         Qo1rn5ILAMiuYrcwudfnMUgmVre73CizBbO2FRZKT7359iP/GIeLvBnyqbkVhKhr125G
         Ks4sZAAJgdMFv9hDhRvYb2577fVUhEtPhQ7eeQ6boDhIiyX7KZw3D+WMkMbR+1+xYIZt
         FNNPg9p0NTs0BZNscMaka41zPzrjKAePh6vwLZdjEIDbv7p34bY8fLIdmBF2R69q9jHE
         5sxCtlXZP29DpdXCXt0s6AebCRqP2NsGvL27JRETsAAsppMXgTy/Vtt3C1YDFI4GZWRj
         YlsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzghjd8W7JWKToVAGNQZ6DDri/Faor5Qd2HLq4Dq+b3L/EWHJe7Zxg0q0HlNSm/KPT22L8C5QQMOxh+EWdI7JDf@lists.infradead.org
X-Gm-Message-State: AFq9FYI/2GJppE0zipRE0CP8D8Rac7So1HfvyCx6SQ3YXNa9kDuW/k4T
	F2VVPAE+UlT18CT7TDI5GNFBbJ8c2cLDb9as5N57kD5luUHkorBXnC24F5bFBqYzNGkz2FOxZQN
	pAGDgEgybdDK96J2B/y+Pwhg9/JhjchgYrX1CEZTT
X-Gm-Gg: AYBFou1Xy0PeCK7SU+qGmm75ZawsnzjF/94udwmVs/aesf0Ku42jJXC6ABDZqeoxlsD
	SI6rThaq5VL58Ok3PjIdRCD0JXVaEpKFQzvZ55F3VJ5skTTm2o7JqDsbgzyTU1hB3I7QCLhv7sf
	1RWgf8NIhjAmspYkswkayK1ckJWyLj1/Euzwq+BHHud3T5ScfGZO/1yrBNAk7bqgbcXBHdH6wk0
	o3VeAp7NmdpSL9v02Khs6mYH04B0BhAITnE2/4jTWRS+UAhUNssUQ+Yz7Lt/2Dct8ooL1wZxj/2
	5pMZJ4xoYBtJP0vOY7jMCyIF1BXx8iP7Qq3YBi/5LUYlZIYbdDh/WWZmo6u+CXAKMzJA1GFZM96
	adBKtexA6rg==
X-Received: by 2002:a05:6102:3f0d:b0:7b3:4199:2de0 with SMTP id
 ada2fe7eead31-7b341994431mr2105212137.4.1790633265847; Mon, 28 Sep 2026
 15:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
 <arrfZ5CYyLt0vwu5@google.com> <CAGG=3QVY_OGjSYZgJ8i8Nb-EbwHKPOvZsbqqXfcbv+Vvq_wsww@mail.gmail.com>
In-Reply-To: <CAGG=3QVY_OGjSYZgJ8i8Nb-EbwHKPOvZsbqqXfcbv+Vvq_wsww@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 28 Sep 2026 15:07:34 -0700
X-Gm-Features: AclHuK8nlJeFMJ-63_0sQ49qEkZQmIZd_Mx0rQvc5qKTUPlWeM5glCx-vJub4Og
Message-ID: <CAFhGd8r_JfpaBvjod+AA6G3BE5S-L8Gs-nc9xMXrxp6_tLOgVw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: Use snprintf() to construct pin bank names
To: Bill Wendling <morbo@google.com>
Cc: Mariia Nikitash <nikitash.mariiaw@gmail.com>, krzk@kernel.org, s.nawrocki@samsung.com, 
	peter.griffin@linaro.org, linusw@kernel.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, 
	aleksandr.loktionov@intel.com, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_150749_056765_1F5EA4F4 
X-CRM114-Status: GOOD (  12.41  )
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

Hi,

On Mon, Sep 28, 2026 at 3:01=E2=80=AFPM Bill Wendling <morbo@google.com> wr=
ote:
> She's been marsheling some of the strlcat patches I sent to the
> mailing list. It's possible I sent a "v2" of all patches, whether
> there were changes in them or not.
>
> The patch series needs to be separated a bit because of Kees's
> 'seq_buf' changes, which will make some of the patches I sent
> obsolete.

ACK

>
> -bw
>

Thanks
Justin

