Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DA5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 21:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcJUXFqkhNJwiNbYGecptgZjcET3vojQdczdYRqpPaU=; b=uyhBPK/1kTlbQWut7B31x5ItWw
	mtvnOOP9hn0KhvSsjCa4TsnzBqn1uDVP/kQnGvHM71nGtFOJsDue0nURoQUKBK+1SjvWvLtFAJlx+
	Bo9HCJ5nUyoEvSjIeH1B4gP8s5+bKG85aamxnRkbMvFCwWTDT9uA5i5+JaU/xk4crkRCIPrCzMzSp
	JfUcaN8Y8z7wv9XzRvOjhfMwG1CIq+Lmtvr5HhQItBY2zowJIrSnd4teW1hEFakOOkILNjfQXbCEg
	Lvf179HtN1oWGSTDfTZ6HESd/GhGQHRZuTryQzQVEomHHoFBa2kK4ecAdLFQk8U/P2ZK6E62L5HAD
	0zEHaWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegSu-00000000HA3-0f0Y;
	Tue, 30 Jun 2026 21:58:00 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wegSq-00000000H9P-3XHl;
	Tue, 30 Jun 2026 21:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1782856671; x=1783461471; i=wahrenst@gmx.net;
	bh=AcJUXFqkhNJwiNbYGecptgZjcET3vojQdczdYRqpPaU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QZ/o35QVmOidJ8FOV1WUvRGl6HnS1Ky+Sg7sfV8GVAqHgcVBmXdA+LF7lNrhSD6p
	 x2NKeJHEeLEdWqyJhI55Xz6vJcABuQQ1HK5TR2He10bwGyXjNXket7/JwPMv8jNFS
	 mowa34H7A/bKMMx4qJnm3irvh+II/OZQ3kbi/cNTAQ9kD316kcnNsgDiBUD/daz63
	 0je1Qbj1ZnyNGPdh+Zuh3BTWCcHWqSR+7g2SxGUqsECz/F6CB+Y//Ba/N1ocKpQ6R
	 mkAGVvLxlLZCiFayFkKjMlvvTGDFh2n7aFMbuAtHX6wUyobPlGL2APqnztdzsussV
	 zS+cbAIo72eGdNqHjA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQ5vW-1wRXI63OXA-00YDOX; Tue, 30
 Jun 2026 23:57:50 +0200
Message-ID: <628b2768-80e6-4a7b-846f-d1124059f899@gmx.net>
Date: Tue, 30 Jun 2026 23:57:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] firmware: raspberrypi: Add reboot mode support
To: Gregor Herburger <gregor.herburger@linutronix.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260630-rpi-tryboot-v2-0-f68d2dc6aa27@linutronix.de>
 <20260630-rpi-tryboot-v2-3-f68d2dc6aa27@linutronix.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260630-rpi-tryboot-v2-3-f68d2dc6aa27@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/aHr4RvF2j6JCEi8YjVHT+eBzdXKfwCbAuPIwuZOG0gwbfSllnq
 nktfbqdqf9JZ26nV3EgrPMyyvWNbAucfV0n0m5zF5Z2TGnAREt2NwwqItxRLKFCW4ngN2HP
 wS7cbUpWxmH0uO22UBWIBjNavgEHpSTFJKk0iBr5ZUrWVKW7XHA9GqG/ISLWF5E0PNQ/RWr
 +bsyJwqFFicwSy/yeRnTA==
UI-OutboundReport: notjunk:1;M01:P0:LSvqYp/RddA=;9R2zH3jrVJc+pRJoP1fC9jljhpw 4YCMKglm7koL87NmgadvHZ8cOFWSwlqRCLlZ8iu7rM73QzlVn5dPGblRVn86ifCa6yMDAUbAh w62Ql6C/PBQ4aLQ1gf6/ATQ6xkzF6yIqvDeiFH7NmawzpoDM1v7s+VI+Y40hYQR9pzYzYTU2/ SNp1yeashboBeY1DmiIoHK0UqVQn9K+GW3jK9sBmod5wgdWqTL+7kIUCCfMNBFGWKubVQNevQ nqnfuulXe9Y9J3S9slaMjgS6ZhGSkFo8cKHmuqjKQ7oQ9uqZYb7FeYqe5FgJzCbB7GZPRhv5M QzXLuSIVZ9/PVnQy3XBmTkw5ukFdDYC8PN8W538j/LuM9Z3iuqs1KzkRQX4K318ccr5nEuXBA ma6JgGxNPi5pdqaG0fl2wlMSrhMA+9KQYyuF0d9YkwLF9+WYqovBoXb3dkkUVySCY+Ug0Ea99 eBRSdkRzKow3Dj5rI0Bi7ygCNRgS+U/8xgMMdFs8NrNODOJqsFqlz57Q6vjXSRmXeFaUsOre9 GwkgdROrmASqAfJ/07zTQTNFRy0YNKe4FpQRkNzGkjyH6SXCRdcnkhZyEFAPA8x4OUzygXdH+ 8i6ZkGGlfDtukT1L3Yh5Sgu4ef/eBtOGzI9bi16T3ryZ5+7EKq/eqdedJng4Flh6a/eLOH086 hP4V4IIjhOejsSo9jqr529AdiExoOiuF7X4950hMnG1h+SZUsCM8B8jfkhfMpInK16GkWKyxd ybeuVnwLWcW678WtyRbPK+5By/Toy8WvNMyaLfdtUZLLEU/f5GT8YsndoqRTnwJWCHdahyVAa P5XRQEmxYBMAav1t+kFGfRzWnvnSbdY0rPsxQ8ivKBDi3DWI1YZztYFAUrtMP39WucW3S+AnB yJTbskRPtC4SuI0pkw8oTc7yUSgaeQCX8Y4gHj3z7nYU11jd2HyoHh/mH9tzTAMeCAu+ohJ1K gpaKkA/qDE7oytUDUoOTKXKGnoGpx1xGoy/lrynwRcUmeTkGz8H5Ip3mQLAfoqNa11tVMp0KQ RwfNSzjxYF4EQisjXrJdRWOhQW6Zl6UIZv0cf9Z5Pc8QdV8ERVnrItDIi2/qxtkVfeYb4ReSN BG7DOShgxU9UKqKdAe3GCmZClsxmxozDnhUKnXFu6r1hSC3MKNNIJQflJSWB430V3YNunBmDF ZCQV8WC+UUzkSHuDmFP4r90ojku7eojtzO6/LNVkCHBYrSnkOv4WFYFc2BWMtbyLZzDFBz4+U xFLWBnfusUjITbnoOWLkZA1fQaz4XRudHu3faJA+xPX37swNukoC5zoJHbhjtV5zO7Va2e+US 5kyevV5F4zFikab6dWNsBXEYg8hc91tQ6o1jUewiOyZ1hyKP9H6QrBVQhfBR1foB2G124PWnu 3Vnc/ycNiqdilAG0DOJxgEJdzjD4AXC52Ql0q2hJAshOD/m7tznpKGvHzUF4/Y+rKI4HmIAX/ Zpx1U6kf3BLeKdrV5qMGGX04xbE6AL8POBBhDk1u8OJxZ7kNx/edpgJ+1dADyuFINYbwcgnL+ f+/2K/SMW4WP3NoGekBevW8Bw+HU8tZHMX63XpTn35rmfpl1bNFSdADcbxd8sf6Q0JFGsqBXp +ARu/I09A8n9ujdSba2rPFMSde8BZ1DPRfd/0m5zreFRCIqNuLfamADJeOxFY70ZF/UYtnXHy 5hzZkjnQGHuumVG3TO1EwqBjHflJUFcIFxz56F0yOgDO3F6C0Pr91/hUebnnL0uTrSBXawAJn 9BP9gFJm52OrtsWdsqmwDsoISmymMnN35mAgCg1SUVcUqwWgIpXLlFKFdSZlRwAWOgEV0V1Vv w6v8IlNIFTJ2l43iiyzMWejdjt2gp5lUuL1mpywDT3DXg5e78AAI1PYCtBinrhhegR3GqqKxF wcVNxdUrKFP/tToGcGo9oBPJHQNDg/LM0TQw5JDotZIxDogCof5pCXe+J0ArkS9HOD/MEa9d0 +Uae/4x+VdCLW+39qOwvaFjbI+ZUzjNClUOq8KVTGCqckpIY5dCvQfyX3+85wvALq0h2Kuhho /OokKFiZ0ECHAMZaC3NflAUHIxdwRNZyEhMO4Tm3GEpBb39l7xNGFk3ke+cEpKQrKTatGRknL FvkaB1iaIHhNfJ3UD/ARN99C3Bw/I3qPHP2OaXpjsPc0tMksVFuaZf1GVuxpKV/AG+x6f5gTd 1/AKsC3YM2/CKNDEbNXKlfiKBf9G6mAYIj66BhssYLIcdk+Aq8ziuUki5iW7C+ZaFAJT1amP0 V0I9SLpYTQdYQ2Bp164UUv5op0Tfk9XpNmVaTkgojAXMvBAZ9evGx3qEXwsbkJpXZWHQuM51O pvf76Ym3K+p2kzN2+0xGSqb5aetkaG9hvHkG04iXc0p/1Dwev3Ktpm1VutZoQUQy4BPs/DTZB 91pH+qZZqBH9yIQZLyK9V+Ouh95akrEB86loW6Yqs5IKGqfaeAKmp5jO91i4LFrahprIf5pUH Eq/ifOjLcrtMRhNB0VvrRX15Jx7accZEoZNfKbdSLK9K35BPiK63t4OkFb+hzMbQC920o8e2/ OM2H81g0nUNxVqYcqBvicAf7mP3eiTuP1VQgzZOcUCKP/U0jbhRKm/rgueFmKIvaD1D7kM7Wh PRbYvkV+KqscWfdXB6w88Kxz6FdUvD5qs+R213bw97q8n0duoOPrwiSBr3oQ1pW2u4PnFTIRB PSF3Mw8Ikbf+4ZCJt5cNQU6hAyPzQUB9GtbH7P89F9UmHgkj8uTAzheRx3StCzo1/6/HBdFNq JBbm1qyIC+lwxkZUHX2umhtMnnSPAV/rwBJkJOzyM7bqqTvV8/AZKEiS+snqS7hg2f3X8Hzr4 KM83KZkem6XME0bg84WiPGJNn1mkwViBE553I03gjiRDrGlsjsBzb5qOuZs1IOXEY02KpQjhV 8ilxvDbHZUswu/NH/F5z1ffGVOsJd+xPQb8ILIgzCq7949t+PiaMsuBT3tA/BDWecVEXyJGeR G7TBt7KKMZ452S1Wgq9tRN8lrFynC6PMmhZRZ/QVhO9WjpBboKgEtAJYXhq6xRtbICCuxkFmS IIfPhN1mV1Lt3X7J/XU5mGnOu9+0SzwyKhBZXFJtXg+PZJkKguDxvSlMqW7FHkRpYSM4KybQZ FtUXNbuYPr6ZwyrlrWBxM6BwvMw99IC7SWPACRlhLV0aOXjgsXjsPZWKJLhRR5h1ykI7LvjnA vtZeQaZXPmLSS8Ea49M6ci4DkGPNjUpNCa2hCjoxLXmgX2SqTFB5cO+KoyWYJc7wF0QqKdcy1 25srYt2BqGWJ7EF6YNDsxcVuymwv5saovEReeliMZ2SA/vbXNh7diFQ9I+YAdbuX+5fMmSg1Q v3MtG+yP+/Ys8IdvZgTJ9HL2TGFVHI29QDefB+hZT8wJXxwNSRQy9V4HIN68DHHtgCIDSOlFF bYNLnY4RdKY6eXby5zEiidd8sWYaAa3NKKAr3Q3iY8c1WmNq2N+uZy+uw50Jny7X0AKu5rnr/ v1mrkGRjvKbA/kykCF6cG+ygwHDLHLEvkE5F9euHVRt0boztUm+YqR4HfYtOAFXSG1wHzagga 0smg+kgXCCiue+/d99W1FSZTCQGJCui10NMbD232L89MlPNhbrJgX39Q9srfnhYfVL25AI0Dl FdQhGZM/O3LTGxTKdm5U1S0LyvxhXOoMRaCtrZXKKFrZOuo49cQAEoFtM+wMjYJ9JJXLfO1uE TtJBaP7xekKOgWPzaLSqJSkdtarIjZJ0VSTF/49N/jKl6xxHp7CWff113TQa1/luECek1DJoD scLPJlH0G9rjus+sRgh1eRVksL43jZJamIbV5wLotN2aT4trXTv7PQZu3gvIQ7G8bsgi18owh JrHikXq6y1+oXV8KIXKtNKNuLpK6irER1o9Ykp+SHe73NL0J2zmz4dX6wPK4PPROfY6SQmo4i
 EE/qwoc3Wn04acCmGIb5+W5BO2BRM3mBm/siRuFg+suJg2dN67maxstNu6X99CCr1XzdXSNXO +c7UbCzR3Mvq1z+J6opUt9UY0rmiyKjkpaJyawU9F6ZzhScJXgZDZa+lhKlFH6lS2xPU0o/dL niYxbbxbGe1WwGK7xNRSmhY9JthcpTxmT6oZ4TvoEl3bZah3b8e/qQJBG5oo6Ms/eTsxVziSy G7ivA0GQWjW5H1qGNzq4XFmhwW78vgjumG2DjGLxrVn2BTfAQnCnJ9pXFP66mi3YKEoFOcTPT zcgueA4kBbBuL+0EXlcZ9bwVA0/KliptK+17R0coD5ZtrMqexf95Qs1ipXkt42Xh1+iMgUD0I J7NSnoaoxHewdloMaDCHo0/LKjDAUn08FQ/D+IsGmgAMNEK7TkDqLxBKfiQbjX30kYB2C0Dgd V+v+IcmpwlwOqZVVzLxOlzaXls5nqWKk+XbwI5bz55h+pz/X44JdfE2by7m7yqCW2h5F4HcM4 MspFOJcEKBvfwnhsq78wrbMF8Ro6o4f/JmIsbIzmdbVhkUVw+qzD/TNX2l3+3OlLgIdCOs/HV limD6uduorBVOht1eHpbG+q4jmUDptXbOqMYO22P22uIGpg6r55JdB+prA/+cYUuhgw/iih8u LZGh1ckc1PaZJ6Cp3RhBYCMUYR6WUcN7cp/zBBLo+Rw+jDmCk70SWEVwSYk+Tj1IDsrSE0r6e NrsqE6Is0DFTxEkBxuG6R8194k0CO0AJojK9kLeOwFcHXhvc/XYYD3vA2sGruSraDJL14N3X8 mMwvWqJAZhJBUubj0I1X0qp90oZ/he+x/1P7pWJo/aRa4/lmzTCUSbv4Xk69JuL0Pne4rkCjv 2c3PfwxmZG9FUMFjAoKB8mENZtqSdmx1SbiGGF73AhtGLjE9tUoYA8VqDPHHYQy/JW2OLYHOI MGrDqdKfYjoj+zz9l0rdr8AcvqeNJlhUfXADhdHxeAS0jvQGBJoVgiHp+un2nBvs18yOYt5vG 2D5ssqtiu+jFljuQv35DAvCOAioMCeRR6IOyY4fiTUVTorbHVKBd+JoOriEynyieLcN83fb/M UnPN3zaY8EO6xDsYnEoeFk5QFPU8uZTW9lh2KyB7auBMrXHVS0NuubVjjfujCyfwdC77NQaq1 V1UHv0qZRSkz/sI7LswA1KXVepr7N4q109bnq0T9GxvBcRVF7E37fVr5jzGFzXYsp7lT/OWYp i99B5lauVeacOMQbfrKkKCKr8VkjuVkF+N/CdA/DG2s8U5cNzcHrEAhJJPGKc9gutrsvLXSok Ol16ftI5C7UyC34Zh74k7dKpS+jrvp9Tm0Q1qBPllUjS9m57dhfwGI3uP5xPlJGJN9aorQboi aG+Y82Y+UXZr740YQe0gEt1APFgvz4x5moXhoOvVYwBY4mqnBHbFCBoiBQb8PpGQy27NfolGk uL0jzVp2LWAfZftTgo1ZvI8SobNUJGF+JOKL83SYwlgXnTXVW56T6VuVWlWSk2euZKajqb4SN /yKXdWuFZ7ngUez3+g2Vy75oLt1ftR9wID3dwWEK6niK/6qRNPW41fakArVZEq7ng2rSD0Ptw 88ah6TTsOswI/jK+9UyN372lH3nKdU11P8BvvqwHpHKz3a0NoVZJqqEMmUpCuZsihRpD+vvZy zOomJsPeO1Lt9X9R5/HMi5RaTN9x7m9vSavUi5RQK4BzJk7ntdD1RBnZkZjH7Z4pg5XrbqCdX jVAlNokliQvQ1LAjdKvOe7DmOPRzQbLayh5a0yQTsjoCdK+/vhjAFcb/7jepQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_145757_249487_EC71C8E2 
X-CRM114-Status: GOOD (  26.32  )
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

Hi Gregor,

Am 30.06.26 um 22:59 schrieb Gregor Herburger:
> The Raspberry Pi firmware has a tryboot mode where it tries to boot from
> another partition. This can be used to create a A/B update schema.
>
> To enable this on the next boot the RPI_FIRMWARE_SET_REBOOT_FLAGS
> message must be send to the firmware.
>
> Add support for this by registering a reboot mode driver.
>
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>   drivers/firmware/Kconfig                   |  1 +
>   drivers/firmware/raspberrypi.c             | 23 ++++++++++++++++++++++=
+
>   include/soc/bcm2835/raspberrypi-firmware.h |  2 ++
>   3 files changed, 26 insertions(+)
>
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index bbd2155d84838..04bc8263e0017 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -115,6 +115,7 @@ config ISCSI_IBFT
>   config RASPBERRYPI_FIRMWARE
>   	tristate "Raspberry Pi Firmware Driver"
>   	depends on BCM2835_MBOX
> +	select REBOOT_MODE
>   	help
>   	  This option enables support for communicating with the firmware on =
the
>   	  Raspberry Pi.
> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberry=
pi.c
> index 0aa322e9a2e73..bba8d14604002 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
> @@ -14,6 +14,7 @@
>   #include <linux/of.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> +#include <linux/reboot-mode.h>
>   #include <linux/slab.h>
>   #include <soc/bcm2835/raspberrypi-firmware.h>
>  =20
> @@ -29,6 +30,7 @@ struct rpi_firmware {
>   	struct mbox_client cl;
>   	struct mbox_chan *chan; /* The property channel. */
>   	struct completion c;
> +	struct reboot_mode_driver reboot_mode;
>   	u32 enabled;
>  =20
>   	struct kref consumers;
> @@ -273,10 +275,25 @@ static void devm_rpi_firmware_put(void *data)
>   	rpi_firmware_put(fw);
>   }
>  =20
> +static int rpi_firmware_reboot_mode_write(struct reboot_mode_driver *re=
boot,
> +					  unsigned int magic)
> +{
> +	struct rpi_firmware *fw =3D container_of(reboot, struct rpi_firmware,
> +					       reboot_mode);
> +	int ret =3D 0;
> +
> +	if (magic)
> +		ret =3D rpi_firmware_property(fw, RPI_FIRMWARE_SET_REBOOT_FLAGS,
> +					    &magic, sizeof(magic));
I think it's more elegant to check for !magic and return 0 directly. So=20
we can drop "ret".
> +
> +	return ret;
> +}
> +
>   static int rpi_firmware_probe(struct platform_device *pdev)
>   {
>   	struct device *dev =3D &pdev->dev;
>   	struct rpi_firmware *fw;
> +	int ret;
>  =20
>   	/*
>   	 * Memory will be freed by rpi_firmware_delete() once all users have
> @@ -306,6 +323,12 @@ static int rpi_firmware_probe(struct platform_devic=
e *pdev)
>   	rpi_register_hwmon_driver(dev, fw);
>   	rpi_register_clk_driver(dev);
>  =20
> +	fw->reboot_mode.dev =3D dev;
> +	fw->reboot_mode.write =3D rpi_firmware_reboot_mode_write;
> +	ret =3D devm_reboot_mode_register(dev, &fw->reboot_mode);
> +	if (ret)
> +		dev_err(dev, "Failed to register reboot mode: %d\n", ret);
I suggest to move all of this code into a function called=20
rpi_register_reboot_mode() ?

Best regards
> +
>   	return 0;
>   }
>  =20
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bc=
m2835/raspberrypi-firmware.h
> index 66cc5a426c3c5..f905bff0fb3ea 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -81,6 +81,7 @@ enum rpi_firmware_property_tag {
>   	RPI_FIRMWARE_GET_POE_HAT_VAL =3D                        0x00030049,
>   	RPI_FIRMWARE_SET_POE_HAT_VAL =3D                        0x00030050,
>   	RPI_FIRMWARE_NOTIFY_XHCI_RESET =3D                      0x00030058,
> +	RPI_FIRMWARE_GET_REBOOT_FLAGS =3D                       0x00030064,
>   	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =3D                    0x00030066,
>   	RPI_FIRMWARE_SET_CLOCK_STATE =3D                        0x00038001,
>   	RPI_FIRMWARE_SET_CLOCK_RATE =3D                         0x00038002,
> @@ -92,6 +93,7 @@ enum rpi_firmware_property_tag {
>   	RPI_FIRMWARE_SET_SDHOST_CLOCK =3D                       0x00038042,
>   	RPI_FIRMWARE_SET_GPIO_CONFIG =3D                        0x00038043,
>   	RPI_FIRMWARE_SET_PERIPH_REG =3D                         0x00038045,
> +	RPI_FIRMWARE_SET_REBOOT_FLAGS =3D                       0x00038064,
>  =20
>   	/* Dispmanx TAGS */
>   	RPI_FIRMWARE_FRAMEBUFFER_ALLOCATE =3D                   0x00040001,
>


