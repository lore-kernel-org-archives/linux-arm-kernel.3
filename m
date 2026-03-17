Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB35CFD877F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZdhQBRrjnNfHh5syYuivaWeXKZt7RqvsGh/omDvP8k=; b=luyzH+QwSkLwmjiYLJa1BjlDeJ
	/LyUXWeka2k+HQzYF1n8JY1yxvnVLfXdOXz0/Sax5zuNrvGSN3MrSp7mFUWtMbL5XHS+nApWRZt6l
	bhx2l8XGKL12Z8ok02U/qkfQMJXAEiy02lESf2IYlCELyHE0U4qUju7PXf3750LsEPppPKjmk4seO
	4UzWJTwHq2cxp607szPgUf1k0TM92wx3wCFApOjZccK7RnFyFZGQLoCK2JbiXk/1KvK0DylHOVjGO
	cwr+Tz+amCzr2dvHoLo9ZzSOJO1bHRIzrpfbnpPIwyEG2i2TdSmMYvXchl+pP9HxIaAkZP0Rb20uH
	gkMuRqoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VOe-00000006btw-1T6L;
	Tue, 17 Mar 2026 14:27:48 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2VOc-00000006btZ-26f5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:27:47 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b97cf8a73d8so215953666b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773757664; cv=none;
        d=google.com; s=arc-20240605;
        b=D8uhtD4xXcmdnaZnvhIThtNEpb1KLE69IfMJ3NnGQnuLy5L+DXMLhjYkUnzgt7t5Ja
         uf3B2KO8FK9mkA6QVWtPU4/noZ4/nqMCxkSmSg79BTMYfT+70y0J9Z1vxL+66AQLrRe6
         c2LnhoUAq4FDan0bynqEwfwI/CU1t/HpWoCH1zGF6EOkP+Ruvya6yDm0wBne8+72Qif6
         KSEg5sidKSvZXCbVffTRTpKgLFAhIcOGrTPwtsbyvW3ys2TmPNUz9Dl3tl3Fdeg0avBC
         VE9OjwKlHZfPFvBtia6/TUxPQ8aAU2wU6aexCZjoHzt/kAfS7L0HOuIr6K8nUdNuJNcd
         6J2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sZdhQBRrjnNfHh5syYuivaWeXKZt7RqvsGh/omDvP8k=;
        fh=Po9RUh1sZlrznqnYHy3lLgPpaowXF4OjoM9qB9iFBgg=;
        b=Lgnb0KE4b7+VfOJy6RiO/NkZue20+YNOVV2pKVbbRv2yqqEs7bx1mZG5qIOsGQSBE9
         /qmi0eHugSb8fIADR11lgcat9Cn1/CsJMS/dHJ/meBxHgv9mEXmWil9zn5NqxLf0piT8
         cgjmuSK1ug/lvldoB8qhMi3hYmIDb3TNqCzea29ZbUAa7o94a6aZc5MW5TpdjuhUFcbP
         9HcdohNOQ86QSex4T2Z5CQEmSVv6/14rLxkYIZw+NMBdAS1ZuF73YK2FZCz5tMD7uI6E
         Jaxve57NzPzY5pDwif4Xg1QyHOGLkdStR0iaMllqv0wpi/RNXcryLelMPelb3Bc/s/U8
         z8Fg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773757664; x=1774362464; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZdhQBRrjnNfHh5syYuivaWeXKZt7RqvsGh/omDvP8k=;
        b=DvmzS9Wp1MY6i++yaWCSs6VNeZM6NIiCyt6DP8tg07w7CL+kibVYQpHMtPqIGrZ82e
         tfbZVFEAKm9mHMSSRrY3EwxZTqTpGs4hmTdOfi5ej4AmGaiEoOxGLIUDN2ZIxz2/oOvZ
         ctZi+6UgNvfYk+5AxyUw7zxxtQOjhh6fdL81564qbI7jVd01cLIv4Xqffopa/iqlQMtT
         PE8VWWWzkDQbM2J3p5pZW9acQ9rxvpGYJ5FH9Pui4oDeiQgD3U843voj3yfNMbeIymlR
         6JxSgPfOMBN7zv14iZF88Hp2FZ27qwmKx+sHfMAQppufc89NKphNegTWrnQNboL4lyyC
         pV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773757664; x=1774362464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sZdhQBRrjnNfHh5syYuivaWeXKZt7RqvsGh/omDvP8k=;
        b=ZJ3II1XPgeGPoEB+q4vhzMK9rpS6jHcoIdVn0lbXz0NTez6Yf/twiOCBF3OEm0woGn
         mABsilf5B7dLwf2QYhYcoNu4FKvMzyBmTBBexwUHg689oA0PFmipSe7p0NJh7yPnj1of
         PLWM+SI3I9/BSztiytUMNlUnJ7hlaj+h9F39SppEcGtAvZ82mf929dx6mOQGAs9XZ5gF
         x3OgN+nFGBR8Az3GiDl2xQ7O7UjZtNUhNf2THEh0MHxZpyPr7rZYIKCbBJjP/2d3JWN0
         I9+gvIo+8KmFsXTO926YTaDXTKYAe1/qs2R6pdMvIWkiG8LvPeCIxqHxIrJ+SNrNaj3N
         zffQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpSCsUXq4dMxLLjZbiOArMgJ0wRo3M+KuZMn4Za4ODXcv7Hyn4f4pVAiPYjLhEU/cxwtcUPL/y047vvsCGDUhd@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9KjGklLdrZR4hg33KR1QyJUJGtuGioW1sxXTbFwXrS4AuZ1Sc
	5iQWP1wzgCyOvzD2SWsD6g3MpJg/Nxj6SQFffzC2tj5QTIV8+2pjcL8Me2MunzIoqckrrsMhRS8
	G1Itv1Ya7uedTVh7vWtLPX8UsV1f56Nk=
X-Gm-Gg: ATEYQzzKeKz/eXzEIdqgCRr1p7c2r/pPBvhPADcGzaELlTCfWyLCsd18xkwhuxZHBCq
	apixYScfDldIwwP7ZboSuuTKAxc7UcXrHxlEKJl+hlO3gNxG6MUFp1xiDf+Fvbw/pk8GsHsSCQl
	s3LAlCPtnOzYHsyh7YvEf950Cv7C75BodWx0oTuS+k06eNxnszYdjngO1s9gYyEFhsgF1NMw57M
	68DQZxM0LITbo3sQY6XQcl+iSx0PvMxrSWlmxNbGqyQVyveDHxvaX4AUC4GqqkZkIhrwgIMeQXF
	8keh1cXz5A==
X-Received: by 2002:a17:907:94d4:b0:b88:6164:6421 with SMTP id
 a640c23a62f3a-b97650d9279mr1182813266b.16.1773757664000; Tue, 17 Mar 2026
 07:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260122161728.1225583-1-a.shimko.dev@gmail.com>
 <CAOPX745OsSOuZirpvW5nXDEbjpZXbmXtgQ6zB=dMX2tP+jhgaw@mail.gmail.com> <20260317-innocent-prawn-of-acumen-68c2ca@sudeepholla>
In-Reply-To: <20260317-innocent-prawn-of-acumen-68c2ca@sudeepholla>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Tue, 17 Mar 2026 17:27:33 +0300
X-Gm-Features: AaiRm515q4nQzSDknmOaXFlze_3MBk3DCZcAsjaCwTqJDRtX0MROUuDo1ELQt6c
Message-ID: <CAOPX745v3qF6r6m0fXiysJ4WDr5L0EsFHKdKChZqRbGSvzMa3g@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: extract domain ID validation helpers
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_072746_555837_CF5A3B3F 
X-CRM114-Status: UNSURE (   7.40  )
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

Hi Sudeep,

On Tue, Mar 17, 2026 at 4:37=E2=80=AFPM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:

> I applied and then realised it is not necessary to churn so much to just
> unify the domain ID validation. So I dropped it.

Got it.

Thank you.
--
Regards,
Artem

